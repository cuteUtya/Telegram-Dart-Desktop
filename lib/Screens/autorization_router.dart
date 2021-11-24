import 'package:flutter/material.dart';
import 'package:myapp/Screens/introduction.dart';
import 'package:myapp/Screens/qr_login.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';

class AutorizationRouter extends StatefulWidget {
  const AutorizationRouter({Key? key, required this.client}) : super(key: key);

  final TelegramClient client;

  @override
  State<StatefulWidget> createState() => _AutorizationRouter();
}

class _AutorizationRouter extends State<AutorizationRouter> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, builder) {
          if (builder.hasData) {
            switch ((builder.data as AuthorizationState).getConstructor()) {
              case AuthorizationStateWaitPhoneNumber.CONSTRUCTOR:
                return IntroductionScreen(
                  qrLoginCallback: () => widget.client
                      .send(RequestQrCodeAuthentication(otherUserIds: [])),
                  client: widget.client,
                  phoneNumberCallback: (phoneNumber, newSessionName) {
                    print(phoneNumber + "    " + (newSessionName ?? ""));
                  },
                );

              case AuthorizationStateWaitTdlibParameters.CONSTRUCTOR:
                widget.client.userLocale = getUserLocale();
                widget.client
                    .setTdlibParameters()
                    //download language strings if we don't have it
                    .then((_) =>
                        {widget.client.getLanguagePackString("lng_start_msgs")})
                    .then((value) => {
                          if (value is TdError)
                            {
                              widget.client.send(GetLanguagePackStrings(
                                  keys: [],
                                  languagePackId: widget.client.userLocale))
                            }
                        });
                break;

              case AuthorizationStateWaitEncryptionKey.CONSTRUCTOR:
                var waitEncryptionKey =
                    builder.data as AuthorizationStateWaitEncryptionKey;

                //[TODO] CURWA, it don't looks safe
                widget.client
                    .send(CheckDatabaseEncryptionKey(encryptionKey: ""));
                break;

              case AuthorizationStateWaitOtherDeviceConfirmation.CONSTRUCTOR:
                var authState = builder.data
                    as AuthorizationStateWaitOtherDeviceConfirmation;
                return QrLogin(
                    client: widget.client,
                    link: authState.link ?? "https://google.com",
                    onBackButtonClick: () => print("TODO"));
            }
          }
          //[TODO] return here LoadScreen
          return const Center(child: Text("LOADING"));
        },
        stream: widget.client.updateAuthorizationState);
  }
}
