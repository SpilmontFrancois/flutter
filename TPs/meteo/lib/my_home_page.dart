import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();

  Map<String, double> coordinates = {
    'latitude': 0,
    'longitude': 0,
  };

  Future<Map<String, String>> weather = Future.value({
    'description': '',
    'icon': '',
    'temperature': '',
    'feels_like': '',
    'humidity': '',
    'wind': '',
    'country': '',
    'city': '',
  });

  final TextEditingController _controller = TextEditingController();

  Future<void> fetchCity(String cityName) async {
    final response = await dio.get(
      'https://api.api-ninjas.com/v1/city?name=$cityName',
      options: Options(
        headers: {'X-Api-Key': dotenv.env['CITY_API_KEY']},
      ),
    );

    if (response.data.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('City not found'),
        ),
      );

      _controller.clear();
    } else {
      setState(() {
        coordinates = {
          'latitude': response.data[0]['latitude'],
          'longitude': response.data[0]['longitude'],
        };
      });

      fetchWeather();
    }
  }

  Future<void> fetchWeather() async {
    final response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather?appid=${dotenv.env['METEO_API_KEY']}&lat=${coordinates['latitude']}&lon=${coordinates['longitude']}&units=metric',
    );

    setState(() {
      weather = Future.value({
        'description': response.data['weather'][0]['description'],
        'icon': response.data['weather'][0]['icon'],
        'temperature': response.data['main']['temp'].toString(),
        'feels_like': response.data['main']['feels_like'].toString(),
        'humidity': response.data['main']['humidity'].toString(),
        'wind': response.data['wind']['speed'].toString(),
        'country': response.data['sys']['country'],
        'city': response.data['name'],
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meteo'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'City name',
              suffixIcon: IconButton(
                onPressed: () {
                  fetchCity(_controller.text);
                },
                icon: const Icon(Icons.search),
              ),
            ),
            onSubmitted: (String value) {
              fetchCity(value);
            },
            controller: _controller,
          ),
          if (_controller.text.isNotEmpty)
            FutureBuilder<Map<String, String>>(
              future: weather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(
                        snapshot.data?['city'] ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data?['country'] ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data?['description'] ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.network(
                        'https://openweathermap.org/img/w/${snapshot.data?['icon']}.png',
                      ),
                      Text(
                        'Temperature: ${snapshot.data?['temperature']}°C',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Feels like: ${snapshot.data?['feels_like']}°C',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Humidity: ${snapshot.data?['humidity']}%',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Wind: ${snapshot.data?['wind']}km/h',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
        ],
      ),
    );
  }
}
