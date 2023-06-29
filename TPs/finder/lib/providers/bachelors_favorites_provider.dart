import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorsFavoritesProvider extends ChangeNotifier {
  final List<Bachelor> _bachelorFavorites = [];

  List<Bachelor> get bachelorFavorites => _bachelorFavorites;

  void add(Bachelor bachelor) {
    _bachelorFavorites.add(bachelor);
    notifyListeners();
  }

  void remove(Bachelor bachelor) {
    _bachelorFavorites.remove(bachelor);
    notifyListeners();
  }

  bool contains(Bachelor bachelor) {
    return _bachelorFavorites.contains(bachelor);
  }

  void toggleLikedBachelor(Bachelor bachelor) {
    if (contains(bachelor)) {
      remove(bachelor);
    } else {
      add(bachelor);
    }
  }

  void clearAllFavorites() {
    _bachelorFavorites.clear();
    notifyListeners();
  }
}
