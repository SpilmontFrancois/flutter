import 'dart:math';

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
  List<Bachelor> likedBachelors = [];

  void toggleLikedBachelor(Bachelor bachelor) {
    setState(() {
      if (likedBachelors.contains(bachelor)) {
        likedBachelors.remove(bachelor);
      } else {
        likedBachelors.add(bachelor);
      }
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: bachelors.length,
          itemBuilder: (BuildContext context, int index) {
            return BachelorPreview(
              bachelor: bachelors[index],
              toggleLikedBachelor: () => toggleLikedBachelor(bachelors[index]),
              isLiked: likedBachelors.contains(bachelors[index]),
            );
          },
        ),
      ),
    );
  }
}
