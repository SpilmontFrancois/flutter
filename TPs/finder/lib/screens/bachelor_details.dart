import 'package:finder/providers/bachelors_favorites_provider.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BachelorDetails extends StatefulWidget {
  const BachelorDetails({Key? key, required this.bachelor}) : super(key: key);

  final Bachelor bachelor;

  @override
  State<BachelorDetails> createState() => _BachelorDetailsState(this.bachelor);
}

class _BachelorDetailsState extends State<BachelorDetails> {
  _BachelorDetailsState(this.bachelor);

  final Bachelor bachelor;

  bool? _isFavorite;
  late bool? _isLiked;

  void likeBachelor(Bachelor bachelor) {
    setState(
      () {
        if (_isFavorite == null) {
          _isFavorite = !_isLiked!;
        } else {
          _isFavorite = !_isFavorite!;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _isLiked = context.watch<BachelorsFavoritesProvider>().contains(bachelor);

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
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(20)),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(bachelor.avatar),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Icon(Icons.favorite,
                    size: 100.0,
                    color: (_isLiked! && _isFavorite == null ||
                            _isFavorite == true)
                        ? Colors.red
                        : Colors.white.withOpacity(0.75),
                    semanticLabel: "Favorite"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(bachelor.firstname, style: const TextStyle(fontSize: 30)),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(bachelor.lastname,
                    style: const TextStyle(fontSize: 30)),
              ),
            ],
          ),
          Column(
            children: [
              // Job
              const Padding(padding: EdgeInsets.all(10)),
              const Text('Job :', style: TextStyle(fontSize: 20)),
              Text(bachelor.job ?? 'No job',
                  style: const TextStyle(fontSize: 15)),
              // Description
              const Padding(padding: EdgeInsets.all(10)),
              const Text('Description :', style: TextStyle(fontSize: 20)),
              Text(bachelor.description ?? 'No description',
                  style: const TextStyle(fontSize: 15)),
              // Button
              const Padding(padding: EdgeInsets.all(10)),
              IconButton(
                icon: Icon(
                    (_isLiked! && _isFavorite == null || _isFavorite == true)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: (_isLiked! && _isFavorite == null ||
                            _isFavorite == true)
                        ? Colors.red
                        : Colors.grey),
                onPressed: () {
                  likeBachelor(bachelor);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        (_isLiked! && _isFavorite == null ||
                                _isFavorite == true)
                            ? "You liked ${bachelor.firstname} ${bachelor.lastname}"
                            : "You disliked ${bachelor.firstname} ${bachelor.lastname}",
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );

                  context
                      .read<BachelorsFavoritesProvider>()
                      .toggleLikedBachelor(bachelor);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
