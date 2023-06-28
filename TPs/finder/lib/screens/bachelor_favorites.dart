import 'package:finder/screens/bachelor_preview.dart';
import 'package:finder/providers/bachelors_favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BachelorFavorites extends StatefulWidget {
  const BachelorFavorites({Key? key}) : super(key: key);

  @override
  State<BachelorFavorites> createState() => _BachelorFavoritesState();
}

class _BachelorFavoritesState extends State<BachelorFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 58, 115, 1),
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: BachelorsFavoritesProvider().bachelorFavorites.length,
          itemBuilder: (BuildContext context, int index) {
            return BachelorPreview(
              bachelor: BachelorsFavoritesProvider().bachelorFavorites[index],
            );
          },
        ),
      ),
    );
  }
}
