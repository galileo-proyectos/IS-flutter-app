import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenScanner extends StatelessWidget {
  ScreenScanner({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text('Is this... the scanner?')
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
