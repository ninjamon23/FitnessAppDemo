import 'package:familiarization/screens/bmi_screen.dart';
import 'package:familiarization/screens/intro_screen.dart';
import 'package:familiarization/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:vxstate/vxstate.dart';

void main(List<String> args) {
  runApp(VxState(
    store: AppStore(),
    child: const FlutterFitnessApp(),
  ));
}

class FlutterFitnessApp extends StatelessWidget {
  const FlutterFitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
        '/weather': (context) => const WeatherPage()
      },
      initialRoute: '/',
    );
  }
}

class AppStore extends VxStore {
  int count = 0;
}

// Mutations
class Increment extends VxMutation<AppStore> {
  @override
  perform() => store!.count++;
}

class Decrement extends VxMutation<AppStore> {
  @override
  perform() => store!.count--;
}
