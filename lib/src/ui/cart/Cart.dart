import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenCart extends StatelessWidget {
  ScreenCart({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text('Is this... the cart?')
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