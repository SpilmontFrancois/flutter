import 'package:finder/providers/bachelors_provider.dart';
import 'package:finder/screens/bachelor_preview.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  @override
  Widget build(BuildContext context) {
    List<Bachelor> bachelors = context.watch<BachelorsProvider>().bachelors;

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
          itemCount: bachelors.where((bachelor) => !bachelor.isRemoved).length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: bachelors
                          .where((bachelor) => !bachelor.isRemoved)
                          .toList()[index]
                          .gender ==
                      Gender.male
                  ? Colors.cyan
                  : Colors.pinkAccent,
              child: BachelorPreview(
                bachelor: bachelors
                    .where((bachelor) => !bachelor.isRemoved)
                    .toList()[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
