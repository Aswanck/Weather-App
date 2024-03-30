import 'package:flutter/material.dart';
import 'package:weatherapi/fetch/weather_service.dart';
import 'package:weatherapi/models/weather_model.dart';
import 'package:weatherapi/weather_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController textcontroller = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  Weather? weather;
  bool loading = false;
  bool error = false;

  Future<void> fetchData() async {
    FocusScope.of(context).unfocus();
    setState(
      () {
        weather = null;
        loading = true;
        error = false;
      },
    );
    var city = textcontroller.text;
    var data = await getWeather(city);
    setState(
      () {
        if (data != null) {
          weather = data;
        } else {
          error = true;
        }

        loading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 40),
              TextFormField(
                controller: textcontroller,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onFieldSubmitted: (String cityName) async {
                  await fetchData();
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter Your City Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  await fetchData();
                },
                child: const Text('Search'),
              ),
              if (weather != null) ...{
                WeatherBox(weather: weather!)
              } else if (loading) ...{
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: CircularProgressIndicator(),
                  ),
                )
              } else if (error) ...{
                const Padding(
                  padding: EdgeInsets.only(top: 180),
                  child: Text(
                    "Something went wrong!!!\nPlease recheck the city name",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }
}
