class Weather {
  final double temp;
  final int pressure;
  final int humidity;
  final double max;
  final String description;
  final String icon;

  Weather({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.max,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'] - 273.15,
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      max: json['main']['temp_max'] - 273.15,
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
