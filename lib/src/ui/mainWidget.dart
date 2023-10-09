import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';
import 'package:multi_screen_app/src/ui/MyRoutes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // GoRouter configuration
  const MyApp({super.key});

  @override
  Widget build (BuildContext ctx) {
    return ChangeNotifierProvider<ModelUser>(
      create: (ctx) => ModelUser.notSignedIn(),
      child: MaterialApp.router(
        routerConfig: MyRoutes.getRoutes()
      )
    );
  }
}
