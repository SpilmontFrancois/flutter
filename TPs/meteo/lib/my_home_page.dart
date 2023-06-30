import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meteo/map.dart';
import 'package:geolocator/geolocator.dart';

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

  bool _fetched = false;

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

      _fetched = true;
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  void geolocate() async {
    if (!await _handleLocationPermission()) return;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      coordinates = {
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
    });

    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meteo'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
              IconButton(
                onPressed: () {
                  geolocate();
                },
                icon: const Icon(Icons.my_location),
              ),
              if (_fetched)
                FutureBuilder<Map<String, String>>(
                  future: weather,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          MyMap(coordinates: coordinates),
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Feels like: ${snapshot.data?['feels_like']}°C',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Humidity: ${snapshot.data?['humidity']}%',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Wind: ${snapshot.data?['wind']}km/h',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
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
        ),
      ),
    );
  }
}
