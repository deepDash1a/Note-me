import 'package:flutter/material.dart';
import 'package:note_app/core/routing/routes.dart';
import 'package:note_app/features/home/ui/screens/home.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
    return null;
  }
}
