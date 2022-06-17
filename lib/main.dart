import 'package:familiarization/screens/intro_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const IntroScreen(),
    );
  }
}
