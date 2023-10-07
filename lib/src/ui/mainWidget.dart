import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/ui/MyRoutes.dart';

class MyApp extends StatelessWidget {
  // GoRouter configuration


  @override
  Widget build (BuildContext ctx) {
    return MaterialApp.router(
      routerConfig: MyRoutes.getRoutes(),
    );
  }
}