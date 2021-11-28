import 'dart:async';

import 'package:flutter/material.dart';
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
  bool loadStrings = false;

  String? _phoneNumber;
  Completer<TdObject>? phoneEnterScreenResultHandler;

  TelegramClient getClient() {
    if (client != null) return client!;
    return widget.client;
  }

  initNewClient({String? sessionName}) {
    getClient()
        .send(LogOut())
        .then((value) => getClient().destroy())
        .then((value) {
      var newClient = TelegramClient();
      newClient.init().then((_) => newClient
          .setTdlibParameters(deviceModel: sessionName)
          .then((_) => setState(() {
                loadStrings = false;
                client = newClient;
              })));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (context, builder) {
          if (builder.hasData) {
            if (!loadStrings) {
              getClient()
                  .loadAllStrings()
                  .then((value) => setState(() => loadStrings = true));
            }
            switch (builder.data.runtimeType) {
              case AuthorizationStateWaitPhoneNumber:
                if (loadStrings) {
                  if (_phoneNumber != null) {
                    setPhone(_phoneNumber!);
                    _phoneNumber = null;
                    break;
                  } else {
                    return !seeIntroduction
                        ? IntroductionScreen(
                            client: getClient(),
                            onNextClick: () =>
                                setState(() => seeIntroduction = true),
                          )
                        : PhoneEnterScreen(
                            client: getClient(),
                            phoneNumberScreenCallback: (number, session) {
                              phoneEnterScreenResultHandler = Completer();
                              if (session.isEmpty) {
                                setPhone(number);
                              } else {
                                _phoneNumber = number;
                                initNewClient();
                              }
                              return phoneEnterScreenResultHandler!.future;
                            });
                  }
                }
                break;

              case AuthorizationStateWaitTdlibParameters:
                getClient().userLocale = getUserLocale();
                getClient().setTdlibParameters();
                break;

              case AuthorizationStateWaitEncryptionKey:
                //TODO CURWA, it don't looks safe
                getClient().send(CheckDatabaseEncryptionKey(encryptionKey: ""));
                break;

              case AuthorizationStateWaitOtherDeviceConfirmation:
                if (loadStrings) {
                  var authState = builder.data
                      as AuthorizationStateWaitOtherDeviceConfirmation;
                  return QrLogin(
                      client: getClient(),
                      link: authState.link!,
                      onBackButtonClick: () => initNewClient());
                }
                break;

              case AuthorizationStateWaitRegistration:
                if (loadStrings) {
                  return RegistrationScreen(
                      termsOfService:
                          (builder.data as AuthorizationStateWaitRegistration)
                              .termsOfService!,
                      client: getClient());
                }
                break;

              case AuthorizationStateWaitCode:
                if (loadStrings) {
                  var codeInfo =
                      (builder.data as AuthorizationStateWaitCode).codeInfo!;
                  return EnterCodeScreen(
                      client: getClient(), codeInfo: codeInfo);
                }
                break;

              case AuthorizationStateWaitPassword:
                if (loadStrings) {
                  return PasswordCheckScreen(
                      client: getClient(),
                      authWaitPassword:
                          builder.data as AuthorizationStateWaitPassword);
                }
                break;

              case AuthorizationStateClosed:
                seeIntroduction = false;
                initNewClient();
                break;
            }
          }
          return const LoadScreen();
        },
        stream: getClient().updateAuthorizationState);
  }

  void setPhone(String phone) {
    getClient()
        .send(SetAuthenticationPhoneNumber(
            phoneNumber: phone,
            settings: PhoneNumberAuthenticationSettings(
                allowFlashCall: false,
                isCurrentPhoneNumber: false,
                allowSmsRetrieverApi: false)))
        .then((value) {
      phoneEnterScreenResultHandler!.complete(value);
    });
  }
}
