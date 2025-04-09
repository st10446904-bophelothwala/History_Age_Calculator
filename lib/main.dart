import 'package:flutter/material.dart';
import './routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'History Calculator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}

/* create project for android and ios
    flutter create --platforms android,ios <your_project_name>

  create projects for windows, macos and linux (desktop - vs editor required)
    flutter create --platforms linux,windows,macos <your_project_name>

  create projects for websites
    flutter create --platforms web <your_project_name>

*/

