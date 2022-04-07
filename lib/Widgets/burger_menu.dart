import 'package:flutter/material.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Userpic/userpic.dart';
import 'package:myapp/Widgets/button_icon.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({
    Key? key,
    required this.client,
    required this.onThemeChange,
  }) : super(key: key);

  final TelegramClient client;
  final VoidCallback onThemeChange;

  @override
  Widget build(BuildContext context) {
    var user = client.getUser(
      client.getOptionValue<OptionValueInteger>("my_id")!.value!,
    );
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ButtonIcon(
              ClientTheme.currentTheme.getField(
                "BurgerMenu.themeIcon",
              ),
              onClick: () {
                ClientTheme.theme =
                    (ClientTheme.theme == "dark" ? "light" : "dark");
                onThemeChange();
              },
              color: ClientTheme.currentTheme.getField(
                "BurgerMenu.themeIcon.color",
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: p(48),
                height: p(48),
                child: Userpic(
                  client: client,
                  profilePhoto: user.profilePhoto,
                  userId: user.id!,
                  userTitle: client.buildUsername(
                    user.firstName!,
                    user.lastName,
                  ),
                ),
              ),
              SizedBox(
                width: p(12),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    client.buildUsername(
                      user.firstName!,
                      user.lastName,
                    ),
                    style: TextDisplay.create(
                      size: font(14),
                      fontWeight: FontWeight.w600,
                      textColor: ClientTheme.currentTheme.getField(
                        "BurgerMenu.name.color",
                      ),
                    ),
                  ),
                  Text(
                    "+${user.phoneNumber}",
                    style: TextDisplay.create(
                      size: font(12),
                      textColor: ClientTheme.currentTheme.getField(
                        "BurgerMenu.phoneNumber.color",
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
