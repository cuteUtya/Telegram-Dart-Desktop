import 'package:flutter/material.dart';
import 'package:myapp/Screens/introduction.dart';
import 'package:myapp/Screens/phone_enter.dart';
import 'package:myapp/Screens/qr_login.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide File;
import 'package:myapp/utils.dart';

class AutorizationRouter extends StatefulWidget {
  const AutorizationRouter({Key? key, required this.client}) : super(key: key);

  final TelegramClient client;

  @override
  State<StatefulWidget> createState() => _AutorizationRouter();
}

class _AutorizationRouter extends State<AutorizationRouter> {
  TelegramClient? client;
  bool seeIntroduction = false;

  TelegramClient getClient() {
    if (client != null) return client!;
    return widget.client;
  }

  initNewClient() => setState(() {
        var newClient = TelegramClient();
        newClient.init().then((_) => newClient.setTdlibParameters());
        client = newClient;
      });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, builder) {
          if (builder.hasData) {
            switch ((builder.data as AuthorizationState).getConstructor()) {
              case AuthorizationStateWaitPhoneNumber.CONSTRUCTOR:
                return client == null && !seeIntroduction
                    ? IntroductionScreen(
                        client: getClient(),
                        onNextClick: () =>
                            setState(() => seeIntroduction = true),
                      )
                    : PhoneEnterScreen(
                        client: getClient(),
                        phoneNumberScreenCallback: (_, __) {},
                        qrLoginCallback: () => getClient().send(
                              RequestQrCodeAuthentication(otherUserIds: []),
                            ));

              case AuthorizationStateWaitTdlibParameters.CONSTRUCTOR:
                getClient().userLocale = getUserLocale();
                getClient()
                    .setTdlibParameters()
                    //download language strings if we don't have it
                    .then((_) =>
                        {getClient().getLanguagePackString("lng_start_msgs")})
                    .then((value) => {
                          if (value is TdError)
                            {
                              getClient().send(GetLanguagePackStrings(
                                  keys: [],
                                  languagePackId: getClient().userLocale))
                            }
                        });
                break;

              case AuthorizationStateWaitEncryptionKey.CONSTRUCTOR:
                var waitEncryptionKey =
                    builder.data as AuthorizationStateWaitEncryptionKey;

                //[TODO] CURWA, it don't looks safe
                getClient().send(CheckDatabaseEncryptionKey(encryptionKey: ""));
                break;

              case AuthorizationStateWaitOtherDeviceConfirmation.CONSTRUCTOR:
                var authState = builder.data
                    as AuthorizationStateWaitOtherDeviceConfirmation;
                return QrLogin(
                    client: widget.client,
                    link: authState.link ?? "https://google.com",
                    onBackButtonClick: () {
                      getClient().destroy();
                      initNewClient();
                    });
            }
          }
          //[TODO] return here LoadScreen
          return const Center(child: Text("LOADING"));
        },
        stream: getClient().updateAuthorizationState);
  }
}
