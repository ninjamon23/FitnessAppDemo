import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/weather.dart';

class HttpHelper {
  // https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=183a1ac36d3e05b3d528f4f81bd5d8b9
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '183a1ac36d3e05b3d528f4f81bd5d8b9';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};

    var uri = Uri.https(authority, path, parameters);
    var result =
        await http.get(uri, headers: {'X-Requested-With': 'XMLHttpRequest'});

    Map<String, dynamic> data = json.decode(result.body);
    var weather = Weather.fromJson(data);
    return weather;
  }
}
