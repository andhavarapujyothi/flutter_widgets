import 'package:flutter/material.dart';

import 'widgets/auto_complete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter', theme: ThemeData(), home: AutocompleteScreen());
  }
}
