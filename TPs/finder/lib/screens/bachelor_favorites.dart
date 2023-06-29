import 'package:finder/models/bachelor.dart';
import 'package:finder/screens/bachelor_preview.dart';
import 'package:finder/providers/bachelors_favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BachelorFavorites extends StatefulWidget {
  const BachelorFavorites({Key? key}) : super(key: key);

  @override
  State<BachelorFavorites> createState() => _BachelorFavoritesState();
}

class _BachelorFavoritesState extends State<BachelorFavorites> {
  String viewMode = 'grid';

  void setViewMode(String mode) {
    setState(() {
      viewMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildColumnView() {
      return Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
          ),
          itemCount: context
              .watch<BachelorsFavoritesProvider>()
              .bachelorFavorites
              .length,
          itemBuilder: (BuildContext context, int index) {
            final bachelor = context
                .watch<BachelorsFavoritesProvider>()
                .bachelorFavorites[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: bachelor.gender == Gender.male
                  ? Colors.cyan
                  : Colors.pinkAccent,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(bachelor.avatar),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(bachelor.firstname,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(bachelor.lastname,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<BachelorsFavoritesProvider>()
                          .toggleLikedBachelor(bachelor);
                    },
                    icon: const Icon(Icons.heart_broken),
                    color: Colors.white,
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    Widget buildListView() {
      return Expanded(
        child: ListView.builder(
          itemCount: context
              .watch<BachelorsFavoritesProvider>()
              .bachelorFavorites
              .length,
          itemBuilder: (BuildContext context, int index) {
            final bachelor = context
                .watch<BachelorsFavoritesProvider>()
                .bachelorFavorites[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: bachelor.gender == Gender.male
                  ? Colors.cyan
                  : Colors.pinkAccent,
              child: Row(
                children: [
                  Expanded(
                    child: BachelorPreview(
                      bachelor: bachelor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<BachelorsFavoritesProvider>()
                          .toggleLikedBachelor(bachelor);
                    },
                    icon: const Icon(Icons.heart_broken),
                    color: Colors.white,
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<BachelorsFavoritesProvider>()
                          .clearAllFavorites();
                      Navigator.pop(context);
                    },
                    child: const Text('Clear all favorites'),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setViewMode('list');
                    },
                    icon: const Icon(Icons.list),
                    color: viewMode == 'list' ? Colors.teal : null),
                IconButton(
                  onPressed: () {
                    setViewMode('grid');
                  },
                  icon: const Icon(Icons.grid_view),
                  color: viewMode == 'grid' ? Colors.teal : null,
                ),
              ],
            ),
            viewMode == 'grid' ? buildColumnView() : buildListView()
          ],
        ),
      ),
    );
  }
}
