import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenSignInSuccess extends StatelessWidget {
  ScreenSignInSuccess({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenSignInSuccess')
        ),
        Center(
            child: ElevatedButton(
              child: Text('Go back'),
              onPressed: () {
                ctx.go('/');
              },
            )
        )
      ],
    );
  }
}