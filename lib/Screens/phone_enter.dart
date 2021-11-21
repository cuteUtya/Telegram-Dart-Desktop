import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:path/path.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:rxdart/streams.dart';

class PhoneEnterScreen extends StatefulWidget {
  PhoneEnterScreen({required this.client, Key? key}) : super(key: key) {
    client.send(GetCountries()).then((value) => countries = value as Countries);
  }
  Countries? countries;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => _PhoneEnterScreenState();
}

class _PhoneEnterScreenState extends State<PhoneEnterScreen> {
  String _phoneCode = "";
  String _country = "";

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
            child: SizedBox(
                width: 500,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        value: _country,
                        controllStateSingly: false,
                        getHintCallback: countryHint,
                        validationCallback: validateCountry,
                        customLabelDisplay: widget.client.buildTextByKey(
                            "lng_payments_billing_country",
                            TextDisplay.create(
                                size: 13, textColor: TextColor.RegularText)),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                              //phone code field
                              child: DataInput(
                                  value: _phoneCode,
                                  controllStateSingly: false,
                                  onValueChange: validatePhoneCode,
                                  customLabelDisplay: widget.client
                                      .buildTextByKey(
                                          "lng_passport_phone_title",
                                          TextDisplay.create(
                                              overflow: TextOverflow.visible,
                                              size: 13,
                                              textColor:
                                                  TextColor.RegularText)),
                                  validationCallback: validatePhoneCode),
                              width: 130),
                          const SizedBox(width: 20),
                          Container(
                              width: 350,
                              child: DataInput(
                                labelFontSize: 13,
                                validationCallback: (e) => true,
                              ))
                        ],
                      ),
                      const SizedBox(height: 16),
                      //phone number field
                      DataInput(
                        validationCallback: (_) => true,
                        fieldName: "Session name",
                        labelFontSize: 13,
                        hintText:
                            widget.client.tdlibParameters.deviceModel ?? "",
                      ),
                      const SizedBox(height: 40),
                      FutureBuilder(
                          future: widget.client
                              .getLanguagePackString("lng_intro_next"),
                          builder: (context, future) {
                            return DesktopButton(
                                width: 500,
                                weight: FontWeight.w500,
                                text: future.hasData
                                    ? (future.data
                                            as LanguagePackStringValueOrdinary)
                                        .value!
                                    : "loading...");
                          }),
                    ]))));
  }

  String countryHint(String value) {
    if (value.isEmpty) return "";
    for (var element in widget.countries!.countries!) {
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
    if (widget.countries != null) {
      for (var element in widget.countries!.countries!) {
        var val = element.name == value || element.englishName == value;
        if (val) {
          setState(() {
            _country = value;
            _phoneCode = "+${element.callingCodes![0]}";
          });
          return val;
        }
      }
    }
    return false;
  }

  bool validatePhoneCode(String value) {
    print("validatePhoneCode($value)");
    if (value.length > 1) {
      value = value.substring(1, value.length);
      if (widget.countries != null) {
        for (var element in widget.countries!.countries!) {
          if (element.callingCodes!.contains(value)) {
            print("SET STATE()");
            setState(() {
              _country = element.name ?? "";
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
