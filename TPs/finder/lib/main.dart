import 'package:finder/finder.dart';
import 'package:finder/providers/bachelors_favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => BachelorsFavoritesProvider(),
    child: Finder(),
  ));
}
