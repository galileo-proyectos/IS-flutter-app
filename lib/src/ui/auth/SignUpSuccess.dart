import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenSignUpSuccess extends StatelessWidget {
  const ScreenSignUpSuccess({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenSignUpSuccess')
        ),
        Center(
            child: ElevatedButton(
              child: const Text('Go back'),
              onPressed: () {
                ctx.go('/');
              },
            )
        )
      ],
    );
  }
}