import 'package:finder/screens/bachelor_favorites.dart';
import 'package:finder/screens/bachelors_master.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Finder extends StatelessWidget {
  Finder({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const BachelorsMaster(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const BachelorFavorites(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finder',
      routerConfig: _router,
    );
  }
}
