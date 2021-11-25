import 'package:flutter/material.dart';
import 'package:myapp/Screens/introduction.dart';
import 'package:myapp/Screens/load_screen.dart';
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
  Widget? lastScreen;

  String? _phoneNumber;

  TelegramClient getClient() {
    if (client != null) return client!;
    return widget.client;
  }

  initNewClient({String? sessionName}) {
    var newClient = TelegramClient();
    newClient.init().then((_) => newClient
        .setTdlibParameters(deviceModel: sessionName)
        .then((value) => setState(() => client = newClient)));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, builder) {
          lastScreen = QrLogin(
              link: "google.com",
              client: widget.client,
              onBackButtonClick: () => {});
          if (builder.hasData) {
            switch ((builder.data as AuthorizationState).getConstructor()) {
              case AuthorizationStateWaitPhoneNumber.CONSTRUCTOR:
                if (_phoneNumber != null) {
                  getClient()
                      .send(SetAuthenticationPhoneNumber(
                          phoneNumber: _phoneNumber,
                          settings: PhoneNumberAuthenticationSettings(
                              allowFlashCall: false,
                              isCurrentPhoneNumber: false,
                              allowSmsRetrieverApi: false)))
                      .then((value) => {if (value is Ok) _phoneNumber = null});
                  break;
                }
                lastScreen = client == null && !seeIntroduction
                    ? IntroductionScreen(
                        client: getClient(),
                        onNextClick: () =>
                            setState(() => seeIntroduction = true),
                      )
                    : PhoneEnterScreen(
                        client: getClient(),
                        phoneNumberScreenCallback: (number, session) {
                          if (session != null) {
                            _phoneNumber = number;
                            getClient().destroy();
                            initNewClient(sessionName: session);
                          }
                        },
                        qrLoginCallback: () => getClient().send(
                              RequestQrCodeAuthentication(otherUserIds: []),
                            ));
                return lastScreen!;

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
                //[TODO] CURWA, it don't looks safe
                getClient().send(CheckDatabaseEncryptionKey(encryptionKey: ""));
                break;

              case AuthorizationStateWaitOtherDeviceConfirmation.CONSTRUCTOR:
                var authState = builder.data
                    as AuthorizationStateWaitOtherDeviceConfirmation;
                lastScreen = QrLogin(
                    client: widget.client,
                    link: authState.link!,
                    onBackButtonClick: () {
                      getClient().destroy();
                      initNewClient();
                    });
                return lastScreen!;
            }
          }
          return Stack(children: [lastScreen ?? const Center(), LoadScreen()]);
        },
        stream: getClient().updateAuthorizationState);
  }
}
