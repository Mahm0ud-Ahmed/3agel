import 'package:flutter/material.dart';

import '../../../../main.dart';

class AppRoute {
  Route generateRoute(RouteSettings route) {
    switch (route.name) {
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Main',));
    }
  }
}