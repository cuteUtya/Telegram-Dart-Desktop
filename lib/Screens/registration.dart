import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import "dart:io" as io;
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/clickable_text.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen(
      {Key? key,
      required this.client,
      required this.registrationCallback,
      required this.termsOfService})
      : super(key: key);

  final TermsOfService termsOfService;
  final Function(String fname, String lname, String? ava) registrationCallback;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? _avaPath;
  String fName = "";
  String lName = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 340,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          GestureDetector(
              onTap: () {
                ///TODO. Validate images, open menu for image cropping. Ability to use video
                widget.client.getLanguagePackString("lng_save_photo").then(
                    (dialogName) => FilePicker.platform
                        .pickFiles(
                            dialogTitle:
                                (dialogName as LanguagePackStringValueOrdinary)
                                    .value)
                        .then((value) => setState(() => _avaPath =
                            (value == null ? null : value.files[0].path))));
              },
              child: _avaPath == null
                  ? Container(
                      child: const Icon(Icons.photo_camera,
                          size: 64, color: Colors.white),
                      width: 108,
                      height: 108,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ClientTheme.currentTheme.getField("Accent")))
                  : Container(
                      width: 108,
                      height: 108,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(io.File(_avaPath!)))))),
          const SizedBox(height: 36),
          widget.client.buildTextByKey("lng_signup_title",
              TextDisplay.create(size: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 18),
          widget.client.buildTextByKey("lng_bad_name",
              TextDisplay.create(textColor: TextColor.AdditionalTextColor)),
          const SizedBox(height: 36),
          //First name
          DataInput(
            validationCallback: (v) => v.length <= 64,
            onValueChange: (v) => fName = v,
            customLabelDisplay: widget.client.buildTextByKey(
                "lng_signup_firstname", TextDisplay.create(size: 14)),
          ),
          const SizedBox(height: 24),
          //Last name
          DataInput(
              validationCallback: (v) => v.length <= 64,
              onValueChange: (v) => lName = v,
              customLabelDisplay: widget.client.buildTextByKey(
                  "lng_signup_lastname", TextDisplay.create(size: 14))),
          const SizedBox(height: 36),
          DesktopButton(
              onPressed: () =>
                  widget.registrationCallback(fName, lName, _avaPath),
              width: 400,
              languagePackStringFuture:
                  widget.client.getLanguagePackString("lng_intro_finish")),
          const Spacer(),
          _TOSAgree(client: widget.client, tos: widget.termsOfService),
          const SizedBox(height: 16)
        ]));
  }
}

class _TOSAgree extends StatelessWidget {
  const _TOSAgree({Key? key, required this.client, required this.tos})
      : super(key: key);
  final TelegramClient client;
  final TermsOfService tos;
  @override
  Widget build(BuildContext context) {
    //it's RichText inside ClickableText inside FutureBuilder inside another FutureBulder
    //yep, look like shit
    return FutureBuilder(
        future: client.getLanguagePackString("lng_terms_signup"),
        builder: (context, data) {
          return FutureBuilder(
              future: client.getLanguagePackString("lng_terms_signup_link"),
              builder: (contex1, data1) {
                if (data.hasData && data1.hasData) {
                  String tosStr =
                      (data1.data as LanguagePackStringValueOrdinary).value!;
                  String str =
                      (data.data as LanguagePackStringValueOrdinary).value!;
                  return ClickableText(
                      onTap: () => showDialog(
                          context: context,
                          builder: (_) => _TOSAlert(
                              title: tosStr, tosText: tos.text!.text!)),
                      builder: (selected) {
                        return RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: str.replaceAll("{link}.", ""),
                                  style: TextDisplay.create(size: 16)),
                              TextSpan(
                                  text: tosStr,
                                  style: TextDisplay.create(
                                      size: 16,
                                      textColor: TextColor.Accent,
                                      decoration: selected
                                          ? TextDecoration.underline
                                          : TextDecoration.none))
                            ]));
                      });
                }
                return Text("loading...", style: TextDisplay.create(size: 16));
              });
        });
  }
}

class _TOSAlert extends StatelessWidget {
  const _TOSAlert({Key? key, required this.title, required this.tosText})
      : super(key: key);

  final String title;
  final String tosText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          title,
          style: TextDisplay.create(size: 24, textColor: TextColor.HeaderMain),
        ),
        content: SizedBox(
          height: 180,
          child: Column(children: [
            Text(tosText, style: TextDisplay.create(size: 16)),
            const Spacer(),
            Container(
              child: DesktopButton(
                text: "OK",
                onPressed: () => Navigator.pop(context, "OK"),
              ),
              alignment: Alignment.bottomRight,
            ),
          ]),
        ));
  }
}
