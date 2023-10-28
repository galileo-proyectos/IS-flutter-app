import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:multi_screen_app/src/ui/MyRoutes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // GoRouter configuration
  const MyApp({super.key});

  @override
  Widget build (BuildContext ctx) {
    return ChangeNotifierProvider<ProviderUser>(
      create: (ctx) => ProviderUser(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: MyRoutes.getRoutes()
    ));
  }
}
