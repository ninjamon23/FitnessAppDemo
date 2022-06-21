import 'package:familiarization/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../api/http_helper.dart';

import '../shared/bottom_nav.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: Column(children: [
        ElevatedButton(
            onPressed: getWeatherByLocation, child: const Text('Get Data')),
        Text(result)
      ]),
    );
  }

  Future getWeatherByLocation() async {
    var helper = HttpHelper();
    result = await helper.getWeather('London');
    setState(() {
      
    });
  }
}
