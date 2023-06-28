import 'package:finder/bachelors_master.dart';
import 'package:flutter/material.dart';

class Finder extends StatelessWidget {
  const Finder({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Finder',
      home: BachelorsMaster(),
    );
  }
}
