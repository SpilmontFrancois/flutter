import 'package:flutter/material.dart';
import 'package:monalisa/artwork.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Museum',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Artwork());
  }
}