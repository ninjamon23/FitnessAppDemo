import 'package:http/http.dart' as http;

class HttpHelper{
  // https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=183a1ac36d3e05b3d528f4f81bd5d8b9
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '183a1ac36d3e05b3d528f4f81bd5d8b9';

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appId':apiKey
    };

    var uri = Uri.https(authority, path, parameters);
    var result = await http.get(uri);

    return result.body;
  }
}