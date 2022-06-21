import 'package:familiarization/shared/menu_drawer.dart';
import 'package:flutter/material.dart';



import '../shared/bottom_nav.dart';class WeatherPage extends StatefulWidget {
  const WeatherPage({ Key? key }) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: const Center(child: FlutterLogo()),
    );
  }
}