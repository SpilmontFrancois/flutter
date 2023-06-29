import 'package:finder/screens/bachelor_preview.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              context.go('/favorites');
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: bachelors.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: bachelors[index].gender == Gender.male ? Colors.cyan : Colors.pinkAccent,
              child: BachelorPreview(
                bachelor: bachelors[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
