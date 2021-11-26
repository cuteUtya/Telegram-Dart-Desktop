import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import "dart:io" as io;
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen(
      {Key? key, required this.client, required this.registrationCallback})
      : super(key: key);

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
                  widget.client.getLanguagePackString("lng_intro_finish"))
        ]));
  }
}
