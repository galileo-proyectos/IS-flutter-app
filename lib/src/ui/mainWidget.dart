import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/cubits/CubitUser.dart';
import 'package:multi_screen_app/src/ui/MyRoutes.dart';

class MyApp extends StatelessWidget {
  // GoRouter configuration
  const MyApp({super.key});

  @override
  Widget build (BuildContext ctx) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitUser>(
          lazy: false,
          create: (BuildContext ctx) => CubitUser(CubitUser.unauthenticatedUser)
        ),
      ],
      child: MaterialApp.router(
        routerConfig: MyRoutes.getRoutes(),
      )
    );
  }
}