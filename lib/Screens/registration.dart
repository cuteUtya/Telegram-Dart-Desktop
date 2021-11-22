import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key, required this.client}) : super(key: key);

  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    throw Exception("Not implemented");
  }
}
