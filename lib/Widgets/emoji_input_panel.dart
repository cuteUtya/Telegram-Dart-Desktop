import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/display_text.dart';

class EmojiInputPanel extends StatelessWidget {
  const EmojiInputPanel({
    Key? key,
  }) : super(key: key);

  static const emojiPanelConfig = [
    "/People/",
    "😀 😃 😄 😁 😆 😅 😂 🤣 🥲 ☺️ 😊",
    "😇 🙂 🙃 😉 😌 😍 🥰 😘 😗 😙 😚",
    "😋 😛 😝 😜 🤪 🤨 🧐 🤓 😎 🥸 🤩",
    "🥳 😏 😒 😞 😔 😟 😕 🙁 ☹️ 😣 😖",
    "😫 😩 🥺 😢 😭 😤 😠 😡 🤬 🤯 😳",
    "🥵 🥶 😱 😨 😰 😥 😓 🤗 🤔 🤭 🤫",
    "🤥 😶 😐 😑 😬 🙄 😯 😦 😧 😮 😲",
    "🥱 😴 🤤 😪 😵 🤐 🥴 🤢 🤮 🤧 😷",
    "🤒 🤕 🤑 🤠 😈 👿 👹 👺 🤡 💩 👻",
    "💀 ☠️ 👽 👾 🤖 🎃 😺 😸 😹 😻 😼",
    "😽 🙀 😿 😾",
    "/Gestures and Body Parts/",
    "👋 🤚 🖐 ✋ 🖖 👌 🤌 🤏 ✌️ 🤞 🤟",
    "🤘 🤙 👈 👉 👆 🖕 👇 ☝️ 👍 👎 ✊",
    "👊 🤛 🤜 👏 🙌 👐 🤲 🤝 🙏 ✍️ 💅",
    "🤳 💪 🦾 🦵 🦿 🦶 👣 👂 🦻 👃 🫀",
    "🫁 🧠 🦷 🦴 👀 👁 👅 👄 💋 🩸",
    "/Clothing and Accessories/",
    "🧳 🌂 ☂️ 🧵 🪡 🪢 🧶 👓 🕶 🥽 🥼",
    "🦺 👔 👕 👖 🧣 🧤 🧥 🧦 👗 👘 🥻",
    "🩴 🩱 🩲 🩳 👙 👚 👛 👜 👝 🎒 👞",
    "👟 🥾 🥿 👠 👡 🩰 👢 👑 👒 🎩 🎓",
    "🧢 ⛑ 🪖 💄 💍 💼",
    "/Animals & Nature/",
    "🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐻‍❄️ 🐨 🐯",
    "🦁 🐮 🐷 🐽 🐸 🐵 🙈 🙉 🙊 🐒 🐔",
    "🐧 🐦 🐤 🐣 🐥 🦆 🦅 🦉 🦇 🐺 🐗",
    "🐴 🦄 🐝 🪱 🐛 🦋 🐌 🐞 🐜 🪰 🪲",
    "🪳 🦟 🦗 🕷 🕸 🦂 🐢 🐍 🦎 🦖 🦕",
    "🐙 🦑 🦐 🦞 🦀 🐡 🐠 🐟 🐬 🐳 🐋",
    "🦈 🐊 🐅 🐆 🦓 🦍 🦧 🦣 🐘 🦛 🦏",
    "🐪 🐫 🦒 🦘 🦬 🐃 🐂 🐄 🐎 🐖 🐏",
    "🐑 🦙 🐐 🦌 🐕 🐩 🦮 🐕‍🦺 🐈 🐈‍⬛ 🪶",
    "🐓 🦃 🦤 🦚 🦜 🦢 🦩 🕊 🐇 🦝 🦨",
    "🦡 🦫 🦦 🦥 🐁 🐀 🐿 🦔 🐾 🐉 🐲",
    "🌵 🎄 🌲 🌳 🌴 🪵 🌱 🌿 ☘️ 🍀 🎍",
    "🪴 🎋 🍃 🍂 🍁 🍄 🐚 🪨 🌾 💐 🌷",
    "🌹 🥀 🌺 🌸 🌼 🌻 🌞 🌝 🌛 🌜 🌚",
    "🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 🌙 🌎 🌍",
    "🌏 🪐 💫 ⭐️ 🌟 ✨ ⚡️ ☄️ 💥 🔥 🌪",
    "🌈 ☀️ 🌤 ⛅️ 🌥 ☁️ 🌦 🌧 ⛈ 🌩 🌨",
    "❄️ ☃️ ⛄️ 🌬 💨 💧 💦 ☔️ ☂️ 🌊 🌫"
  ];

  Color get _baseColor => ClientTheme.currentTheme.getField("EmojiInputPanelBackgroundColor");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: _baseColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: emojiPanelConfig
                .map((column) => column[0] == "/"
                    ? Text(
                        column.replaceAll("/", ""),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: column.split(" ").map((row) => _buildEmoji(row)).toList(),
                      ))
                .toList(),
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
