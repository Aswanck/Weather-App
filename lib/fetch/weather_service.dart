import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weatherapi/models/weather_model.dart';
import 'constants.dart';

Future<Weather?> getWeather(String city) async {
  final response = await http.get(
    Uri.parse("$url?q=$city&appid=$apiKey"),
  );
  if (response.statusCode == 200) {
    var data = response.body;
    log(data);

    return Weather.fromJson(
      jsonDecode(response.body),
    );
  } else {
    return null;
  }
}
