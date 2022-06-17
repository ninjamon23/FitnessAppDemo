import 'package:familiarization/screens/bmi_screen.dart';
import 'package:familiarization/screens/intro_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const FlutterFitnessApp());
}

class FlutterFitnessApp extends StatelessWidget {
  const FlutterFitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi':(context) => const BmiScreen()
      },
      initialRoute: '/',
    );
  }
}
