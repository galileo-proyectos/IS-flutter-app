import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/cubits/CubitEmail.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenSignIn')
        ),
        Center(
            child: ElevatedButton(
              child: Text(ctx.read<CubitEmail>().getEmail()),
              onPressed: () {
                ctx.go('/');
              },
            )
        )
      ],
    );
  }
}