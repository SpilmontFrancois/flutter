import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:finder/data.dart' as data;

class BachelorsProvider extends ChangeNotifier {
  final List<Bachelor> _bachelors = data.createBachelors();

  List<Bachelor> get bachelors => _bachelors;

  void dislikeBachelor(Bachelor bachelor) {
    bachelor.setIsRemoved(true);
    notifyListeners();
  }
}
