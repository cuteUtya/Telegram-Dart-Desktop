import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/Screens/app_main.dart';
import 'package:myapp/Screens/auth_wait_code.dart';
import 'package:myapp/Screens/introduction.dart';
import 'package:myapp/Screens/load_screen.dart';
import 'package:myapp/Screens/password_check.dart';
import 'package:myapp/Screens/phone_enter.dart';
import 'package:myapp/Screens/qr_login.dart';
import 'package:myapp/Screens/registration.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide File;

class AutorizationRouter extends StatefulWidget {
  const AutorizationRouter({Key? key, required this.client}) : super(key: key);

  final TelegramClient client;

  @override
  State<StatefulWidget> createState() => _AutorizationRouter();
}

class _AutorizationRouter extends State<AutorizationRouter> {
  TelegramClient? client;
  bool seeIntroduction = false;
  String? _phoneNumber;
  Completer<TdObject>? phoneEnterScreenResultHandler;

  TelegramClient getClient() {
    if (client != null) return client!;
    return widget.client;
  }

  initNewClient({String? sessionName}) {
    getClient().send(LogOut()).then((value) => getClient().destroy()).then((value) {
      var newClient = TelegramClient();
      newClient
          .init()
          .then((_) => newClient.setTdlibParameters(deviceModel: sessionName).then((_) => setState(() => client = newClient)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, builder) {
        if (builder.hasData) {
          switch (builder.data.runtimeType) {
            case AuthorizationStateWaitPhoneNumber:
              if (_phoneNumber != null) {
                setPhone(_phoneNumber!);
                _phoneNumber = null;
                break;
              } else {
                return !seeIntroduction
                    ? IntroductionScreen(
                        client: getClient(),
                        onNextClick: () => setState(() => seeIntroduction = true),
                      )
                    : PhoneEnterScreen(
                        client: getClient(),
                        phoneNumberScreenCallback: (number, session) {
                          phoneEnterScreenResultHandler = Completer();
                          if (session.isEmpty) {
                            setPhone(number);
                          } else {
                            _phoneNumber = number;
                            initNewClient(sessionName: session);
                          }
                          return phoneEnterScreenResultHandler!.future;
                        },
                      );
              }

            case AuthorizationStateWaitTdlibParameters:
              getClient().setTdlibParameters();
              break;

            case AuthorizationStateWaitEncryptionKey:
              //TODO CURWA, it don't looks safe
              getClient().send(CheckDatabaseEncryptionKey(encryptionKey: ""));
              break;

            case AuthorizationStateWaitOtherDeviceConfirmation:
              var authState = builder.data as AuthorizationStateWaitOtherDeviceConfirmation;
              return QrLogin(client: getClient(), link: authState.link!, onBackButtonClick: () => initNewClient());

            case AuthorizationStateWaitRegistration:
              return RegistrationScreen(
                  termsOfService: (builder.data as AuthorizationStateWaitRegistration).termsOfService!, client: getClient());

            case AuthorizationStateWaitCode:
              var codeInfo = (builder.data as AuthorizationStateWaitCode).codeInfo!;
              return EnterCodeScreen(client: getClient(), codeInfo: codeInfo);

            case AuthorizationStateWaitPassword:
              return PasswordCheckScreen(client: getClient(), authWaitPassword: builder.data as AuthorizationStateWaitPassword);

            case AuthorizationStateClosed:
              seeIntroduction = false;
              initNewClient();
              break;

            case AuthorizationStateReady:
              getClient().send(SetOption(name: "online", value: OptionValueBoolean(value: true)));
              return AppMain(client: getClient());
          }
        }
        return const LoadScreen();
      },
      stream: getClient().updateAuthorizationState,
    );
  }

  void setPhone(String phone) {
    getClient()
        .send(SetAuthenticationPhoneNumber(
            phoneNumber: phone,
            settings: PhoneNumberAuthenticationSettings(
                allowFlashCall: false, isCurrentPhoneNumber: false, allowSmsRetrieverApi: false)))
        .then((value) {
      phoneEnterScreenResultHandler!.complete(value);
    });
  }
}
