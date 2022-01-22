import 'dart:convert';
import 'package:http/http.dart' as http;

class ItunesAPI {
  static const _searchUri =
      "https://itunes.apple.com/search?term=%name% - %performer%&entity=song&limit=%limit%";
  static Future<ITunesSearchResult?> findSong(
      {required String name,
      required String perfomer,
      int maxResults = 2}) async {
    var responce = await http.get(Uri.parse(_searchUri
        .replaceFirst("%name%", name)
        .replaceFirst("%performer%", perfomer)
        .replaceFirst("%limit%", maxResults.toString())));
    if (responce.statusCode.toString()[0] == "2") {
      var responceJson = utf8.decode(responce.bodyBytes, allowMalformed: true);
      return ITunesSearchResult.fromJson(json.decode(responceJson));
    }
  }
}

class ITunesSearchResult {
  int? resultCount;
  List<ItunesSong>? results;

  ITunesSearchResult({resultCount, results});

  ITunesSearchResult.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <ItunesSong>[];
      json['results'].forEach((v) {
        results!.add(ItunesSong.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['resultCount'] = resultCount;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItunesSong {
  String? wrapperType;
  String? kind;
  int? artistId;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? collectionArtistName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  String? contentAdvisoryRating;
  bool? isStreamable;

  ItunesSong(
      {this.wrapperType,
      this.kind,
      this.artistId,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.collectionArtistName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.discCount,
      this.discNumber,
      this.trackCount,
      this.trackNumber,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.contentAdvisoryRating,
      this.isStreamable});

  ItunesSong.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    artistId = json['artistId'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    collectionArtistName = json['collectionArtistName'];
    artistViewUrl = json['artistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    isStreamable = json['isStreamable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['wrapperType'] = wrapperType;
    data['kind'] = kind;
    data['artistId'] = artistId;
    data['collectionId'] = collectionId;
    data['trackId'] = trackId;
    data['artistName'] = artistName;
    data['collectionName'] = collectionName;
    data['trackName'] = trackName;
    data['collectionCensoredName'] = collectionCensoredName;
    data['trackCensoredName'] = trackCensoredName;
    data['collectionArtistName'] = collectionArtistName;
    data['artistViewUrl'] = artistViewUrl;
    data['collectionViewUrl'] = collectionViewUrl;
    data['trackViewUrl'] = trackViewUrl;
    data['previewUrl'] = previewUrl;
    data['artworkUrl30'] = artworkUrl30;
    data['artworkUrl60'] = artworkUrl60;
    data['artworkUrl100'] = artworkUrl100;
    data['collectionPrice'] = collectionPrice;
    data['trackPrice'] = trackPrice;
    data['releaseDate'] = releaseDate;
    data['collectionExplicitness'] = collectionExplicitness;
    data['trackExplicitness'] = trackExplicitness;
    data['discCount'] = discCount;
    data['discNumber'] = discNumber;
    data['trackCount'] = trackCount;
    data['trackNumber'] = trackNumber;
    data['trackTimeMillis'] = trackTimeMillis;
    data['country'] = country;
    data['currency'] = currency;
    data['primaryGenreName'] = primaryGenreName;
    data['contentAdvisoryRating'] = contentAdvisoryRating;
    data['isStreamable'] = isStreamable;
    return data;
  }
}
