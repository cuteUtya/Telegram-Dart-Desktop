import 'dart:convert';

class MP3ParserException implements Exception {
  String cause;
  MP3ParserException(this.cause);
  @override
  String toString() {
    return cause;
  }
}

class _MP3FrameParser {
  List<int> buffer;
  int pos = 0;
  int lastEncoding = 0x00; // default to latin1
  _MP3FrameParser(this.buffer);
  List<int> readUntilTerminator(List<int> terminator,
      {bool aligned = false, bool terminatorMandatory = true}) {
    if (remainingBytes == 0) {
      return [];
    }
    for (int i = pos;
        i < buffer.length - (terminator.length - 1);
        i += (aligned ? terminator.length : 1)) {
      bool foundTerminator = true;
      for (int j = 0; j < terminator.length; j++) {
        if (buffer[i + j] != terminator[j]) {
          foundTerminator = false;
          break;
        }
      }
      if (foundTerminator) {
        final start = pos;
        pos = i + terminator.length;
        return buffer.sublist(start, pos - terminator.length);
      }
    }
    if (terminatorMandatory) {
      throw MP3ParserException(
          "Did not find terminator $terminator in ${buffer.sublist(pos)}");
    } else {
      return buffer.sublist(pos);
    }
  }

  String readLatin1String({bool terminator = true}) {
    return latin1
        .decode(readUntilTerminator([0x00], terminatorMandatory: terminator));
  }

  String readUTF16LEString({bool terminator = true}) {
    final bytes = readUntilTerminator([0x00, 0x00],
        aligned: true, terminatorMandatory: terminator);
    // final utf16les = List<int?>((bytes.length / 2).ceil());
    final utf16les = List.generate((bytes.length / 2).ceil(), (index) => 0);

    for (int i = 0; i < bytes.length; i++) {
      if (i % 2 == 0) {
        utf16les[i ~/ 2] = bytes[i];
      } else {
        utf16les[i ~/ 2] |= (bytes[i] << 8);
      }
    }
    return String.fromCharCodes(utf16les);
  }

  String readUTF16BEString({bool terminator = true}) {
    final bytes =
        readUntilTerminator([0x00, 0x00], terminatorMandatory: terminator);
    // final utf16bes = List<int?>((bytes.length / 2).ceil());
    final utf16bes = List.generate((bytes.length / 2).ceil(), (index) => 0);

    for (int i = 0; i < bytes.length; i++) {
      if (i % 2 == 0) {
        utf16bes[i ~/ 2] = (bytes[i] << 8);
      } else {
        utf16bes[i ~/ 2] |= bytes[i];
      }
    }
    return String.fromCharCodes(utf16bes);
  }

  String readUTF16String({bool terminator = true}) {
    final bom = buffer.sublist(pos, pos + 2);
    if (bom[0] == 0xFF && bom[1] == 0xFE) {
      pos += 2;
      return readUTF16LEString(terminator: terminator);
    } else if (bom[0] == 0xFE && bom[1] == 0xFF) {
      pos += 2;
      return readUTF16BEString(terminator: terminator);
    } else if (bom[0] == 0x00 && bom[1] == 0x00) {
      pos += 2;
      return "";
    } else {
      throw MP3ParserException(
          "Unknown UTF-16 BOM: $bom in ${buffer.sublist(pos)}");
    }
  }

  String readUTF8String({bool terminator = true}) {
    final bytes = readUntilTerminator([0x00], terminatorMandatory: terminator);
    return Utf8Decoder().convert(bytes);
  }

  void readEncoding() {
    if (buffer[pos] < 20) {
      if (lastEncoding == 0x01) {
        // Do not modify the BOM, 0x01 must apply to each field
        pos++;
      } else {
        lastEncoding = buffer[pos++];
      }
    }
  }

  String readString({bool terminator = true, bool checkEncoding: true}) {
    if (checkEncoding) {
      readEncoding();
    }
    if (pos == buffer.length) {
      return '';
    }
    if (lastEncoding == 0x00) {
      return readLatin1String(terminator: terminator);
    } else if (lastEncoding == 0x01) {
      return readUTF16String(terminator: terminator);
    } else if (lastEncoding == 0x02) {
      return readUTF16BEString(terminator: terminator);
    } else if (lastEncoding == 0x03) {
      return readUTF8String(terminator: terminator);
    } else {
      throw MP3ParserException(
          "Unknown Byte-Order Marker: $lastEncoding in $buffer");
    }
  }

  List<int> readBytes(int length) {
    pos += length;
    return buffer.sublist(pos - length, pos);
  }

  List<int> readRemainingBytes() {
    return buffer.sublist(pos);
  }

  int get remainingBytes {
    return buffer.length - pos;
  }
}

class MP3Instance {
  final List<int> mp3Bytes;
  final Map<String, dynamic> _metaTags = {};

  /// Member Functions
  MP3Instance(this.mp3Bytes) {
    _parseTagsSync();
  }

  bool _parseTagsSync() {
    List<int> _tag;
    _tag = mp3Bytes.sublist(0, 3);

    if (latin1.decode(_tag) == 'ID3') {
      final int major_v = mp3Bytes[3];
      final int revision_v = mp3Bytes[4];
      final int flag = mp3Bytes[5];

      final bool unsync = (0x40 & flag != 0);
      final bool extended = (0x20 & flag != 0);
      final bool experimental = (0x10 & flag != 0);

      _metaTags['Version'] = 'v2.$major_v.$revision_v';

      if (extended) {
        print('Extended id3v2 tags are not supported yet!');
      } else if (unsync) {
        print('Unsync id3v2 tags are not supported yet!');
      } else if (experimental) {
        print('Experimental id3v2 tag');
      }

      int cb = 10;

      Map<String, String> frames_db = FRAMESv2_3;
      int frameNameLength = 4;
      int frameSizeLength = 4;
      int frameTagLength = 2;
      if (major_v == 2) {
        frames_db = FRAMESv2_2;
        frameNameLength = 3;
        frameSizeLength = 3;
        frameTagLength = 0;
      }
      final int frameHeaderLength =
          frameNameLength + frameSizeLength + frameTagLength;

      while (true) {
        final List<int> frameHeader =
            mp3Bytes.sublist(cb, cb + frameHeaderLength);
        final List<int> frameName = frameHeader.sublist(0, frameNameLength);

        final RegExp exp = RegExp(r'[A-Z0-9]+');
        if (latin1.decode(frameName) !=
            exp.stringMatch(latin1.decode(frameName))) {
          break;
        }

        final int frameSize = parseSize(
            frameHeader.sublist(
                frameNameLength, frameNameLength + frameSizeLength),
            major_v);
        final List<int> frameContent = mp3Bytes.sublist(
            cb + frameHeaderLength, cb + frameHeaderLength + frameSize);

        if (frames_db[latin1.decode(frameName)] == FRAMESv2_3['APIC']) {
          final Map<String, String> apic = {
            'mime': '',
            'textEncoding': frameContent[0].toString(),
            'picType': '',
            'description': '',
            'base64': ''
          };

          final frame = _MP3FrameParser(frameContent);
          frame.readEncoding();
          // In ID3v2.2 the MIME type is always 3 characters
          if (major_v == 2) {
            apic['mime'] = latin1.decode(frame.readBytes(3));
          } else {
            apic['mime'] = frame.readLatin1String();
          }
          apic['picType'] = PICTYPE[frame.readBytes(1).first] ?? 'Unknown';
          apic['description'] = frame.readString(checkEncoding: false);
          apic['base64'] = base64.encode(frame.readRemainingBytes());
          _metaTags['APIC'] = apic;
        } else if (frames_db[latin1.decode(frameName)] == FRAMESv2_3['USLT']) {
          final frame = _MP3FrameParser(frameContent);
          frame.readEncoding();
          final language = latin1.decode(frame.readBytes(3));
          String contentDescriptor;
          contentDescriptor = frame.readString(checkEncoding: false);
          final lyrics = (frame.remainingBytes > 0)
              ? frame.readString(checkEncoding: false, terminator: false)
              : contentDescriptor;
          if (frame.remainingBytes == 0) {
            contentDescriptor = '';
          }
          _metaTags['USLT'] = {
            'language': language,
            'contentDescriptor': contentDescriptor,
            'lyrics': lyrics
          };
        } else if (frames_db[latin1.decode(frameName)] == FRAMESv2_3['WXXX']) {
          final frame = _MP3FrameParser(frameContent);
          _metaTags['WXXX'] = {
            'description': frame.readString(),
            'url': frame.readLatin1String(terminator: false)
          };
        } else if (frames_db[latin1.decode(frameName)] == FRAMESv2_3['COMM']) {
          final frame = _MP3FrameParser(frameContent);
          frame.readEncoding();
          final language = latin1.decode(frame.readBytes(3));
          final shortDescription = frame.readString(checkEncoding: false);
          final text =
              frame.readString(terminator: false, checkEncoding: false);
          if (_metaTags['COMM'] == null) {
            _metaTags['COMM'] = {};
            if (_metaTags['COMM'][language] == null) {
              _metaTags['COMM'][language] = {};
            }
          }
          _metaTags['COMM'][language][shortDescription] = text;
        } else if (frames_db[latin1.decode(frameName)] == FRAMESv2_3['MCDI'] ||
            frames_db[latin1.decode(frameName)] == FRAMESv2_3['RVAD']) {
          // Binary data
          _metaTags[frames_db[latin1.decode(frameName)] ??
              latin1.decode(frameName)] = frameContent;
        } else {
          final String tag =
              frames_db[latin1.decode(frameName)] ?? latin1.decode(frameName);
          _metaTags[tag] =
              _MP3FrameParser(frameContent).readString(terminator: false);
        }

        cb += frameHeaderLength + frameSize;
      }

      return true;
    }

    final List<int> _header =
        mp3Bytes.sublist(mp3Bytes.length - 128, mp3Bytes.length);
    _tag = _header.sublist(0, 3);

    if (latin1.decode(_tag).toLowerCase() == 'tag') {
      _metaTags['Version'] = '1.0';

      final List<int> _title = _header.sublist(3, 33);
      final List<int> _artist = _header.sublist(33, 63);
      final List<int> _album = _header.sublist(63, 93);
      final List<int> _year = _header.sublist(93, 97);
      final List<int> _comment = _header.sublist(97, 127);
      final int _genre = _header[127];

      _metaTags['Title'] = latin1.decode(_title).trim();
      _metaTags['Artist'] = latin1.decode(_artist).trim();
      _metaTags['Album'] = latin1.decode(_album).trim();
      _metaTags['Year'] = latin1.decode(_year).trim();
      _metaTags['Comment'] = latin1.decode(_comment).trim();
      _metaTags['Genre'] = GENREv1[_genre];

      return true;
    }

    return false;
  }

  T? getMetaTag<T>(String name) => _metaTags[name];
}

int parseSize(List<int> block, int major_v) {
  int len;
  if (major_v == 4) {
    assert(block.length == 4);
    len = block[0] << 21;
    len += block[1] << 14;
    len += block[2] << 7;
    len += block[3];
  } else if (major_v == 3) {
    assert(block.length == 4);
    len = block[0] << 24;
    len += block[1] << 16;
    len += block[2] << 8;
    len += block[3];
  } else if (major_v == 2) {
    assert(block.length == 3);
    len = block[0] << 16;
    len += block[1] << 8;
    len += block[2];
  } else {
    throw MP3ParserException("Unknown major version $major_v");
  }

  return len;
}

List<int> cleanFrame(List<int> bytes) {
  List<int> temp = List<int>.from(bytes);

  temp.removeWhere((item) => item < 1);

  if (temp.length > 3) {
    return temp.sublist(3);
  } else {
    return temp;
  }
}

List<int> removeZeros(List<int> bytes) {
  return bytes.where((i) => i != 0).toList();
}

const Map<String, String> FRAMESv2_2 = {
  'CNT': 'PlayCounter',
  'COM': 'Comment',
  'CRA': 'Encryption',
  'EQU': 'Equalization',
  'IPL': 'People',
  'LNK': 'Information',
  'PIC': 'APIC',
  'POP': 'Popularimeter',
  'REV': 'Reverb',
  'SLT': 'Transcript',
  'TAL': 'Album',
  'TBP': 'BPM',
  'TCM': 'Composer',
  'TCO': 'ContentType',
  'TCR': 'Copyright',
  'TDA': 'Date',
  'TEN': 'EncodedBy',
  'TFT': 'FileType',
  'TIM': 'Time',
  'TKE': 'Key',
  'TLA': 'Language',
  'TLE': 'Length',
  'TMT': 'MediaType',
  'TOA': 'OriginalPerformer',
  'TOF': 'OriginalFilename',
  'TOL': 'OriginalLyricist',
  'TOR': 'OriginalReleaseYear',
  'TOT': 'OriginalAlbum',
  'TP1': 'Artist',
  'TP2': 'Accompaniment',
  'TP3': 'Conductor',
  'TP4': 'ModifiedBy',
  'TPB': 'Publisher',
  'TRC': 'ISRC',
  'TRK': 'Track',
  'TSI': 'Size',
  'TSS': 'Settings',
  'TT1': 'Content',
  'TT2': 'Title',
  'TT3': 'SubTitle',
  'TXT': 'Lyricist',
  'TXX': 'AdditionalInfo',
  'TYE': 'Year',
  'UFI': 'ID',
  'ULT': 'UnsyncTranscript',
  'WAF': 'OFileWebpage',
  'WAR': 'OArtistWebpage',
  'WAS': 'OAudioWebpage',
  'WCM': 'CommercialInfo',
  'WCP': 'CopyrightInfo',
  'WPB': 'OPublisherWebpage',
  'WXX': 'CLink'
};

const Map<String, String> FRAMESv2_3 = {
  'AENC': 'Encryption',
  'APIC': 'APIC',
  'COMM': 'Comment',
  'COMR': 'Commercial',
  'ENCR': 'ENCR',
  'EQUA': 'Equalization',
  'ETCO': 'ETCO',
  'GEOB': 'GEOB',
  'GRID': 'GRID',
  'IPLS': 'People',
  'LINK': 'Information',
  'MCDI': 'MCDI',
  'MLLT': 'MLLT',
  'OWNE': 'OWNE',
  'PRIV': 'PRIV',
  'PCNT': 'PlayCounter',
  'POPM': 'Popularimeter',
  'POSS': 'POSS',
  'RBUF': 'RBUF',
  'RVAD': 'RVAD',
  'SYLT': 'Lyrics',
  'SYTC': 'SYTC',
  'TALB': 'Album',
  'TBPM': 'BPM',
  'TCOM': 'Composer',
  'TCON': 'Genre',
  'TCOP': 'Copyright',
  'TDAT': 'Date',
  'TDLY': 'Playlist',
  'TENC': 'EncodedBy',
  'TEXT': 'Lyricist',
  'TFLT': 'FileType',
  'TIME': 'Time',
  'TIT1': 'Content',
  'TIT2': 'Title',
  'TIT3': 'SubTitle',
  'TKEY': 'Key',
  'TLAN': 'Language',
  'TLEN': 'Length',
  'TMED': 'MediaType',
  'TOAL': 'OriginalAlbum',
  'TOFN': 'OriginalFilename',
  'TOLY': 'OriginalLyricist',
  'TOPE': 'OriginalPerformer',
  'TORY': 'OriginalReleaseYear',
  'TOWN': 'Owner',
  'TPE1': 'Artist',
  'TPE2': 'Accompaniment',
  'TPE3': 'Conductor',
  'TPE4': 'ModifiedBy',
  'TPOS': 'TPOS',
  'TPUB': 'Publisher',
  'TRCK': 'Track',
  'TRDA': 'RecordedOn',
  'TRSN': 'RadioStation',
  'TRSO': 'RadioStationOwner',
  'TSIZ': 'Size',
  'TSRC': 'ISRC',
  'TSSE': 'Settings',
  'TYER': 'Year',
  'TXXX': 'AdditionalInfo',
  'UFID': 'ID',
  'USER': 'Terms',
  'USLT': 'UnsyncTranscript',
  'WCOM': 'CommercialInfo',
  'WCOP': 'CopyrightInfo',
  'WOAF': 'OFileWebpage',
  'WOAR': 'OArtistWebpage',
  'WOAS': 'OAudioWebpage',
  'WORS': 'ORadioWebpage',
  'WPAY': 'Payment',
  'WPUB': 'OPublisherWebpage',
  'WXXX': 'CLink'
};

const GENREv1 = [
  'Blues',
  'Classic Rock',
  'Country',
  'Dance',
  'Disco',
  'Funk',
  'Grunge',
  'Hip-Hop',
  'Jazz',
  'Metal',
  'New Age',
  'Oldies',
  'Other',
  'Pop',
  'Rhythm and Blues',
  'Rap',
  'Reggae',
  'Rock',
  'Techno',
  'Industrial',
  'Alternative',
  'Ska',
  'Death Metal',
  'Pranks',
  'Soundtrack',
  'Euro-Techno',
  'Ambient',
  'Trip-Hop',
  'Vocal',
  'Jazz & Funk',
  'Fusion',
  'Trance',
  'Classical',
  'Instrumental',
  'Acid',
  'House',
  'Game',
  'Sound clip',
  'Gospel',
  'Noise',
  'Alternative Rock',
  'Bass',
  'Soul',
  'Punk',
  'Space',
  'Meditative',
  'Instrumental Pop',
  'Instrumental Rock',
  'Ethnic',
  'Gothic',
  'Darkwave',
  'Techno-Industrial',
  'Electronic',
  'Pop-Folk',
  'Eurodance',
  'Dream',
  'Southern Rock',
  'Comedy',
  'Cult',
  'Gangsta',
  'Top 40',
  'Christian Rap',
  'Pop/Funk',
  'Jungle music',
  'Native US',
  'Cabaret',
  'New Wave',
  'Psychedelic',
  'Rave',
  'Showtunes',
  'Trailer',
  'Lo-Fi',
  'Tribal',
  'Acid Punk',
  'Acid Jazz',
  'Polka',
  'Retro',
  'Musical',
  'Rock ’n’ Roll',
  'Hard Rock'
];

const PICTYPE = {
  0x00: 'Other',
  0x01: 'FileIcon',
  0x02: 'OtherFileIcon',
  0x03: 'FrontCover',
  0x04: 'BackCover',
  0x05: 'LeafletPage',
  0x06: 'Media (e.g. lable side of CD)',
  0x07: 'LeadArtist',
  0x08: 'Artist',
  0x09: 'Conductor',
  0x0A: 'Band',
  0x0B: 'Composer',
  0x0C: 'Lyricist',
  0x0D: 'RecordingLocation',
  0x0E: 'DuringRecording',
  0x0F: 'DuringPerformance',
  0x10: 'VideoStill',
  // Might be a joke but it's in the ID3 spec
  0x11: 'ABrightColouredFish',
  0x12: 'Illustration',
  0x13: 'ArtistLogo',
  0x14: 'PublisherLogo'
};
