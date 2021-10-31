import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/introduction.dart';
import 'main.reflectable.dart';

void main() async {
  initializeReflectable();
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Center(child: Introduction());
  }
}
