import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import "dart:io" as io;
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen(
      {Key? key, required this.client, required this.termsOfService})
      : super(key: key);

  final TermsOfService termsOfService;
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
              //TODO. Validate images, open menu for image cropping. Ability to use video
              onTap: () =>
                  FilePicker.platform.pickFiles(dialogTitle: widget.client.getTranslation("lng_save_photo")).then(
                      (value) => setState(() => _avaPath =
                          (value == null ? null : value.files[0].path))),
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
                          image: DecorationImage(fit: BoxFit.fill, image: FileImage(io.File(_avaPath!)))))),
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
              fieldName: widget.client.getTranslation("lng_signup_firstname")),
          const SizedBox(height: 24),
          //Last name
          DataInput(
              validationCallback: (v) => v.length <= 64,
              onValueChange: (v) => lName = v,
              fieldName: widget.client.getTranslation("lng_signup_lastname")),
          const SizedBox(height: 36),
          DesktopButton(
              //TODO set userpic
              onPressed: () => widget.client
                  .send(RegisterUser(firstName: fName, lastName: lName)),
              width: 400,
              text: widget.client.getTranslation("lng_intro_finish")),
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
    var tosText = client.getTranslation("lng_terms_signup");
    var tosLink = client.getTranslation("lng_terms_signup_link");
    return ClickabeObject(
        onTap: () => showDialog(
            context: context,
            builder: (_) =>
                _TOSAlert(title: tosLink, tosText: tos.text!.text!)),
        builder: (selected) {
          return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: tosText.replaceAll("{link}.", ""),
                    style: TextDisplay.create(size: 16)),
                TextSpan(
                    text: tosLink,
                    style: TextDisplay.create(
                        size: 16,
                        textColor: TextColor.Accent,
                        decoration: selected
                            ? TextDecoration.underline
                            : TextDecoration.none))
              ]));
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
          style: TextDisplay.title,
        ),
        content: SizedBox(
          height: 180,
          child: Column(children: [
            Text(tosText, style: TextDisplay.regular16),
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
