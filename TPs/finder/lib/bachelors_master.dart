import 'package:finder/bachelor_preview.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:finder/data.dart' as data;

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  List<Bachelor> bachelors = data.createBachelors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 58, 115, 1),
        title: const Text(
          'Finder',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return BachelorPreview(bachelor: bachelors[index]);
        },
        itemCount: bachelors.length,
      ),
    );
  }
}
