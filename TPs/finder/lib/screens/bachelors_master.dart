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
  String searchValue = '';
  Gender? selectedGender = Gender.all;
  final fieldText = TextEditingController();

  void search() {
    context.read<BachelorsProvider>().search(searchValue);
  }

  void clearText() {
    fieldText.clear();
    searchValue = '';
    search();
  }

  @override
  Widget build(BuildContext context) {
    List<Bachelor> bachelors = context.watch<BachelorsProvider>().bachelors;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
          child: Column(
            children: [
              TextField(
                controller: fieldText,
                onChanged: (value) {
                  searchValue = value;
                  search();
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        clearText();
                      },
                      icon: const Icon(Icons.clear)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: const Text('All'),
                    leading: Radio<Gender>(
                      value: Gender.all,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Males'),
                    leading: Radio<Gender>(
                      value: Gender.male,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Females'),
                    leading: Radio<Gender>(
                      value: Gender.female,
                      groupValue: selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bachelors
                      .where((bachelor) =>
                          !bachelor.isDisliked &&
                          bachelor.show &&
                          (bachelor.gender == selectedGender ||
                              selectedGender == Gender.all))
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    final Bachelor bachelor = bachelors
                        .where((bachelor) =>
                            !bachelor.isDisliked &&
                            bachelor.show &&
                            (bachelor.gender == selectedGender ||
                                selectedGender == Gender.all))
                        .toList()[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: bachelor.gender == Gender.male
                          ? Colors.cyan
                          : Colors.pinkAccent,
                      child: BachelorPreview(
                        bachelor: bachelor,
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
