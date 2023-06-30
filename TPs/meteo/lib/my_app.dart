import 'package:flutter/material.dart';
import 'package:meteo/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meteo',
      color: Colors.blueGrey,
      home: MyHomePage(),
    );
  }
}