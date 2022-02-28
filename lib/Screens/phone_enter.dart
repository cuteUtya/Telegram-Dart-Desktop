import 'package:flutter/material.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/clickable_text.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

class PhoneEnterScreen extends StatefulWidget {
  const PhoneEnterScreen(
      {required this.client, required this.phoneNumberScreenCallback, Key? key})
      : super(key: key);

  final TelegramClient client;
  final Future<TdObject> Function(String phoneNumber, String sessionName)
      phoneNumberScreenCallback;
  @override
  State<StatefulWidget> createState() => _PhoneEnterScreenState();
}

class _PhoneEnterScreenState extends State<PhoneEnterScreen> {
  String _phoneCode = "+";
  String _phone = "";
  DataState _phoneState = DataState.empty;
  String _country = "";
  String _sessionName = "";

  String? errorStr;

  bool sendCode = false;

  Countries? countries;

  final Map<DataState, FontWeight> _weigths = {
    DataState.empty: FontWeight.normal,
    DataState.valid: FontWeight.w600,
    DataState.invalid: FontWeight.w600
  };

  final Map<DataState, Color> _colors = {
    DataState.empty: ClientTheme.currentTheme.getField("RegularText"),
    DataState.valid: ClientTheme.currentTheme.getField("Accent"),
    DataState.invalid: ClientTheme.currentTheme.getField("DangerColor")
  };

  @override
  Widget build(BuildContext context) {
    if (countries == null) {
      widget.client
          .send(GetCountries())
          .then((value) => setState(() => countries = value as Countries));
    }
    var width = MediaQuery.of(context).size.width *
        (UIManager.useDesktopLayout ? 0.5 : 0.90);
    return Center(
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.client.buildTextByKey("lng_phone_title", TextDisplay.title),
            const SizedBox(height: 8),
            widget.client
                .buildTextByKey("lng_phone_desc", TextDisplay.additional),
            const SizedBox(height: 20),
            DataInput(
              value: _country,
              externalControll: true,
              getHintCallback: countryHint,
              validationCallback: validateCountry,
              fieldName: widget.client.getTranslation("lng_country_ph"),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                    //phone code field
                    child: DataInput(
                        value: _phoneCode,
                        externalControll: true,
                        onValueChange: validatePhoneCode,
                        onDataStateChanged: (v) => _phoneState = v,
                        customLabel: widget.client.buildTextByKey(
                          "lng_passport_phone_title",
                          TextDisplay.create(
                            overflow: TextOverflow.visible,
                            size: 13,
                            textColor: _colors[_phoneState],
                            fontWeight: _weigths[_phoneState],
                          ),
                        ),
                        validationCallback: validatePhoneCode),
                    width: width * 0.25),
                SizedBox(width: width * 0.05),
                SizedBox(
                  width: width * 0.70,
                  child: DataInput(
                    onValueChange: (v) => _phone = v,
                    labelFontSize: 13,
                    validationCallback: (e) => true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DesktopButton(
                      width: width * 0.66,
                      onPressed: () async {
                        if (!sendCode) {
                          sendCode = true;
                          var phoneCallbackResult =
                              await widget.phoneNumberScreenCallback(
                                  _phoneCode + _phone, _sessionName);
                          if (phoneCallbackResult is TdError) {
                            setState(
                              () {
                                errorStr = widget.client
                                    .getLocalizedErrorMessage(
                                        phoneCallbackResult);
                              },
                            );
                          }
                        }
                      },
                      weight: FontWeight.w500,
                      text: widget.client.getTranslation("lng_intro_next"),
                    ),
                    const SizedBox(height: 4),
                    errorStr == null
                        ? const SizedBox()
                        : Text(
                            "hey some shit", //errorStr!,
                            style: TextDisplay.regular18,
                          ),
                  ]),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 24),
              alignment: Alignment.bottomCenter,
              child: ClickableText(
                  data: widget.client.getTranslation("lng_phone_to_qr"),
                  onTap: () => widget.client
                      .send(RequestQrCodeAuthentication(otherUserIds: [])),
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );

    /*Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),


              //Country field


              ,
              const SizedBox(height: 16),
              //session name field
              DataInput(
                onValueChange: (v) => _sessionName = v,
                fieldName: "Session name",
                labelFontSize: 13,
                externalControll: true,
                value: _sessionName,
                hintText: widget.client.tdlibParameters.deviceModel ?? "",
              ),



              const Spacer(),

            ],
          ),
        ),

    );*/
  }

  String countryHint(String value) {
    if (value.isEmpty) return "";
    for (var element in countries!.countries!) {
      if (element.name!.length >= value.length) {
        if (value == element.name!.substring(0, value.length)) {
          return element.name!;
        } else if (value == element.englishName!.substring(0, value.length)) {
          return element.englishName!;
        }
      }
    }

    return "";
  }

  bool validateCountry(String value) {
    for (var element in countries!.countries!) {
      var val = element.name == value || element.englishName == value;
      if (val) {
        setState(() {
          _country = value;
          _phoneState = DataState.valid;
          _phoneCode = "+${element.callingCodes![0]}";
        });
        return val;
      }
    }

    return false;
  }

  bool validatePhoneCode(String value) {
    if (value.length > 1) {
      value = value.substring(1, value.length);
      if (countries != null) {
        for (var element in countries!.countries!) {
          if (element.callingCodes!.contains(value)) {
            setState(() {
              if (_country != element.englishName && _country != element.name) {
                _country = element.name ?? "";
              }
              _phoneCode = "+$value";
            });
            return true;
          }
        }
      }
    }
    return false;
  }
}
