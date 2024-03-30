import 'package:flutter/material.dart';
import 'package:weatherapi/models/weather_model.dart';

class WeatherBox extends StatefulWidget {
  final Weather weather;

  const WeatherBox({super.key, required this.weather});

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.network(
            "https://openweathermap.org/img/wn/${widget.weather.icon}@2x.png",
          ),
          Text(
            widget.weather.description.toUpperCase(),
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 45),
          Text(
            "Temperature : ${widget.weather.temp.toInt()}°C",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Pressure : ${widget.weather.pressure} hpa",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Humidity : ${widget.weather.humidity} %",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Todays High Temp: ${widget.weather.max.toInt()} °C",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
