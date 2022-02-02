import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/utils.dart';

class EmojiInputPanel extends StatelessWidget {
  const EmojiInputPanel({
    Key? key,
  }) : super(key: key);

  static const emojiPanelConfig = [
    "/People/",
    "😀 😃 😄 😁 😆 😅 😂 🤣 🥲 ☺️ 😊 😇 🙂 🙃 😉 😌 😍 🥰 😘 😗 😙 😚 😋 😛 😝 😜 🤪 🤨 🧐 🤓 😎 🥸 🤩 🥳 😏 😒 😞 😔 😟 😕 🙁 ☹️ 😣 😖 😫 😩 🥺 😢 😭 😤 😠 😡 🤬 🤯 😳 🥵 🥶 😱 😨 😰 😥 😓 🤗 🤔 🤭 🤫 🤥 😶 😐 😑 😬 🙄 😯 😦 😧 😮 😲 🥱 😴 🤤 😪 😵 🤐 🥴 🤢 🤮 🤧 😷 🤒 🤕 🤑 🤠 😈 👿 👹 👺 🤡 💩 👻 💀 ☠️ 👽 👾 🤖 🎃 😺 😸 😹 😻 😼 😽 🙀 😿 😾",
    "/Gestures and Body Parts/",
    "👋 🤚 🖐 ✋ 🖖 👌 🤌 🤏 ✌️ 🤞 🤟 🤘 🤙 👈 👉 👆 🖕 👇 ☝️ 👍 👎 ✊ 👊 🤛 🤜 👏 🙌 👐 🤲 🤝 🙏 ✍️ 💅 🤳 💪 🦾 🦵 🦿 🦶 👣 👂 🦻 👃 🫀 🫁 🧠 🦷 🦴 👀 👁 👅 👄 💋 🩸",
    "/Clothing and Accessories/",
    "🧳 🌂 ☂️ 🧵 🪡 🪢 🧶 👓 🕶 🥽 🥼 🦺 👔 👕 👖 🧣 🧤 🧥 🧦 👗 👘 🥻 🩴 🩱 🩲 🩳 👙 👚 👛 👜 👝 🎒 👞 👟 🥾 🥿 👠 👡 🩰 👢 👑 👒 🎩 🎓 🧢 ⛑ 🪖 💄 💍 💼",
    "/Animals & Nature/",
    "🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐻‍❄️ 🐨 🐯 🦁 🐮 🐷 🐽 🐸 🐵 🙈 🙉 🙊 🐒 🐔 🐧 🐦 🐤 🐣 🐥 🦆 🦅 🦉 🦇 🐺 🐗 🐴 🦄 🐝 🪱 🐛 🦋 🐌 🐞 🐜 🪰 🪲 🪳 🦟 🦗 🕷 🕸 🦂 🐢 🐍 🦎 🦖 🦕 🐙 🦑 🦐 🦞 🦀 🐡 🐠 🐟 🐬 🐳 🐋 🦈 🐊 🐅 🐆 🦓 🦍 🦧 🦣 🐘 🦛 🦏 🐪 🐫 🦒 🦘 🦬 🐃 🐂 🐄 🐎 🐖 🐏 🐑 🦙 🐐 🦌 🐕 🐩 🦮 🐕‍🦺 🐈 🪶 🐓 🦃 🦤 🦚 🦜 🦢 🦩 🕊 🐇 🦝 🦨 🦡 🦫 🦦 🦥 🐁 🐀 🐿 🦔 🐾 🐉 🐲 🌵 🎄 🌲 🌳 🌴 🪵 🌱 🌿 ☘️ 🍀 🎍 🪴 🎋 🍃 🍂 🍁 🍄 🐚 🪨 🌾 💐 🌷 🌹 🥀 🌺 🌸 🌼 🌻 🌞 🌝 🌛 🌜 🌚 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 🌙 🌎 🌍 🌏 🪐 💫 ⭐️ 🌟 ✨ ⚡️ ☄️ 💥 🔥 🌪 🌈 ☀️ 🌤 ⛅️ 🌥 ☁️ 🌦 🌧 ⛈ 🌩 🌨 ❄️ ☃️ ⛄️ 🌬 💨 💧 💦 ☔️ ☂️ 🌊 🌫"
  ];

  Color get _baseColor => ClientTheme.currentTheme.getField("EmojiInputPanelBackgroundColor");

  @override
  Widget build(BuildContext context) {
    int maxEmoji = MediaQuery.of(context).size.width ~/ 200;
    return Container(
      height: 600,
      color: _baseColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: emojiPanelConfig.map((column) {
              Widget result;
              if (column[0] == "/") {
                result = Text(
                  column.replaceAll("/", ""),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                );
              } else {
                var emojis = column.split(" ");
                if (emojis.length > maxEmoji) {
                  List<Widget> cols = [];
                  var colsCount = emojis.length ~/ maxEmoji;
                  if (emojis.length / maxEmoji > 0.0) colsCount++;

                  for (int i = 0; i < colsCount; i++) {
                    var sIndex = i >= colsCount - 1 ? (emojis.length) % maxEmoji : maxEmoji;
                    cols.add(Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        sIndex,
                        (index) => _buildEmoji(
                          emojis[(i * maxEmoji) + index].replaceAll(" ", ""),
                        ),
                      ),
                    ));
                  }
                  result = Column(
                    children: cols,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  );
                } else {
                  result = Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: emojis.map((row) => _buildEmoji(row)).toList(),
                  );
                }
              }
              return result;
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildEmoji(String emoji) => ClickableObject(
        builder: (hover) => Container(
          decoration: BoxDecoration(
            color: hover ? Color.fromARGB(255, 88, 88, 88) : _baseColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                6,
              ),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text.rich(
              TextDisplay.parseEmojiInString(
                emoji,
                const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      );
}
