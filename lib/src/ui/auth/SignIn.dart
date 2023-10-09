import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              child: const Text('hello flutter'),
              onPressed: () {
                ctx.go('/');
              },
            )
        )
      ],
    );
  }
}