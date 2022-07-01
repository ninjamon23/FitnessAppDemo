import 'package:familiarization/data/weather.dart';
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
  Weather result = Weather('', '', 0, 0, 0, 0);
  var txtPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const BottomNav(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                    hintText: 'Enter a city',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: getWeatherByLocation,
                    )),
              ),
            ),
            weatherRow('Place: ', result.name),
            weatherRow('Description: ', result.desription),
            weatherRow('Temperature: ', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived: ', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure: ', result.pressure.toString()),
            weatherRow('Humidity: ', result.humidity.toString())
          ]),
        ));
  }

  Future getWeatherByLocation() async {
    var helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
          ),
          flex: 3,
        ),
        Expanded(
          child: Text(
            value,
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
          ),
          flex: 3,
        ),
      ]),
    );

    return row;
  }

  void showModal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('title'),
        content: const Text('content body'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'))
        ],
      ),
    );
  }
}
