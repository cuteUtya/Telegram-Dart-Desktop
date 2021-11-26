import 'package:flutter/material.dart';
import 'package:myapp/Widgets/clickable_text.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class PhoneEnterScreen extends StatefulWidget {
  const PhoneEnterScreen(
      {required this.client,
      required this.phoneNumberScreenCallback,
      required this.qrLoginCallback,
      Key? key})
      : super(key: key);

  final void Function() qrLoginCallback;
  final TelegramClient client;
  final PhoneNumberScreenCallback phoneNumberScreenCallback;
  @override
  State<StatefulWidget> createState() => _PhoneEnterScreenState();
}

class _PhoneEnterScreenState extends State<PhoneEnterScreen> {
  String _phoneCode = "+";
  String _phone = "";
  DataState _phoneState = DataState.empty;
  String _country = "";
  DataState _countryState = DataState.empty;
  String _sessionName = "";

  Countries? countries;

  final Map<DataState, FontWeight> _weigths = {
    DataState.empty: FontWeight.normal,
    DataState.valid: FontWeight.w600,
    DataState.invalid: FontWeight.w600
  };

  final Map<DataState, TextColor> _colors = {
    DataState.empty: TextColor.RegularText,
    DataState.valid: TextColor.Accent,
    DataState.invalid: TextColor.DangerColor
  };

  @override
  Widget build(BuildContext context) {
    if (countries == null) {
      widget.client
          .send(GetCountries())
          .then((value) => setState(() => countries = value as Countries));
    }

    return Material(
        child: Center(
            child: SizedBox(
                width: 500,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      widget.client.buildTextByKey(
                          "lng_phone_title",
                          TextDisplay.create(
                              size: 24,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.left)),
                      const SizedBox(height: 8),
                      widget.client.buildTextByKey(
                          "lng_phone_desc",
                          TextDisplay.create(
                              textColor: TextColor.AdditionalTextColor,
                              size: 16,
                              textAlign: TextAlign.left)),
                      const SizedBox(height: 20),
                      //Country field
                      DataInput(
                        onDataStateChanged: (v) => _countryState = v,
                        value: _country,
                        externalControll: true,
                        getHintCallback: countryHint,
                        validationCallback: validateCountry,
                        customLabelDisplay: widget.client.buildTextByKey(
                            "lng_payments_billing_country",
                            TextDisplay.create(
                                size: 13,
                                textColor: _colors[_countryState],
                                fontWeight: _weigths[_countryState])),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                              //phone code field
                              child: DataInput(
                                  value: _phoneCode,
                                  externalControll: true,
                                  onValueChange: validatePhoneCode,
                                  onDataStateChanged: (v) => _phoneState = v,
                                  customLabelDisplay: widget.client
                                      .buildTextByKey(
                                          "lng_passport_phone_title",
                                          TextDisplay.create(
                                              overflow: TextOverflow.visible,
                                              size: 13,
                                              textColor: _colors[_phoneState],
                                              fontWeight:
                                                  _weigths[_phoneState])),
                                  validationCallback: validatePhoneCode),
                              width: 130),
                          const SizedBox(width: 20),
                          Container(
                              width: 350,
                              //phone field
                              child: DataInput(
                                onValueChange: (v) => _phone = v,
                                labelFontSize: 13,
                                validationCallback: (e) => true,
                              ))
                        ],
                      ),
                      const SizedBox(height: 16),
                      //session name field
                      DataInput(
                        onValueChange: (v) => _sessionName = v,
                        validationCallback: (_) => true,
                        fieldName: "Session name",
                        labelFontSize: 13,
                        externalControll: true,
                        value: _sessionName,
                        hintText:
                            widget.client.tdlibParameters.deviceModel ?? "",
                      ),
                      const SizedBox(height: 40),
                      DesktopButton(
                          onPressed: () => widget.phoneNumberScreenCallback(
                              _phoneCode + _phone, _sessionName),
                          width: 500,
                          weight: FontWeight.w500,
                          languagePackStringFuture: widget.client
                              .getLanguagePackString("lng_intro_next")),
                      const Spacer(),
                      Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          alignment: Alignment.bottomCenter,
                          child: ClickableText(
                              onTap: () => widget.qrLoginCallback(),
                              builder: (select) {
                                return widget.client.buildTextByKey(
                                    "lng_phone_to_qr",
                                    TextDisplay.create(
                                        textAlign: TextAlign.center,
                                        size: 18,
                                        textColor: TextColor.Accent,
                                        decoration: select
                                            ? TextDecoration.underline
                                            : TextDecoration.none));
                              }))
                    ]))));
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

typedef PhoneNumberScreenCallback = void Function(
    String phoneNumber, String? sessionName);
