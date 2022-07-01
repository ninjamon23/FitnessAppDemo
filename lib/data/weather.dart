class Weather {
  String name = '';
  String desription = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.desription, this.temperature, this.perceived,
      this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    temperature = weatherMap['main']['temp'];
    perceived = weatherMap['main']['feels_like'];
    pressure = weatherMap['main']['pressure'];
    humidity = weatherMap['main']['humidity'];
    desription = weatherMap['weather'][0]['description'] ?? '';
  }
}
