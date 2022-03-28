import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'dart:convert';
import 'dart:io' as io;
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/Audio%20utils/id3_metatags_utils.dart';
import 'package:myapp/Audio%20utils/itunes_api.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;
import 'package:myapp/utils.dart';

class MessageDisplayAudio extends StatelessWidget {
  const MessageDisplayAudio({
    Key? key,
    required this.message,
    required this.client,
    required this.infoWidget,
    required this.replieWidget,
  }) : super(key: key);

  final Message message;
  final TelegramClient client;
  final Widget? infoWidget;
  final Widget? replieWidget;
  @override
  Widget build(BuildContext context) {
    assert(message.content is MessageAudio);
    var audio = message.content as MessageAudio;
    return MessageDisplayText(
      client: client,
      message: message,
      infoWidget: infoWidget,
      additionalContentPlace: AdditionalContentPlace.top,
      additionalContent: Container(
        child: _audioItem(audio, client),
        margin: EdgeInsets.only(
          bottom: (audio.caption?.text?.isEmpty ?? true) ? p(4) : 0,
          right: p(6),
        ),
      ),
      replieWidget: replieWidget,
      text: audio.caption,
    );
  }

  static Widget _audioItem(MessageAudio audio, TelegramClient client) {
    bool haveThumbnail = audio.audio?.albumCoverThumbnail != null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RemoteFileBuilder(
            builder: (_, path) {
              var apic = MP3Instance(io.File(path).readAsBytesSync())
                  .getMetaTag<Map<String, String>>("APIC")?["base64"];
              return ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: apic != null || haveThumbnail
                    ? Image(
                        width: p(32),
                        height: p(32),
                        image: (haveThumbnail
                            ? FileImage(io.File(path))
                            : MemoryImage(base64Decode(apic!))
                                as ImageProvider))
                    : FutureBuilder(
                        builder: (_, data) => data.hasData && data.data != null
                            ? Image.network(
                                (data.data as ITunesSearchResult)
                                    .results![0]
                                    .artworkUrl100!,
                                width: p(32),
                                height: p(32),
                              )
                            : Container(),
                        future: ItunesAPI.findSong(
                          name: audio.audio!.title!,
                          perfomer: audio.audio!.performer!,
                        ),
                      ),
              );
            },
            fileId: haveThumbnail
                ? audio.audio!.albumCoverThumbnail!.file!.id!
                : audio.audio!.audio!.id!,
            client: client),
        SizedBox(width: p(6)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              audio.audio!.title!,
              style: TextDisplay.create(
                size: font(14),
                textColor:
                    ClientTheme.currentTheme.getField("AudioTitleTextColor"),
              ),
            ),
            Text(
              "${getMMSS(audio.audio!.duration!)} • ${audio.audio!.performer}",
              style: TextDisplay.regular18,
            )
          ],
        )
      ],
    );
  }
}
