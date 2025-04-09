import 'package:flutter/material.dart';
import '../pages/home.dart';

class AppRoutes {
  static const String home = '/';
  
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(), // HomeScreen contains the structure
  };
}
