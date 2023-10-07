import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Here goes some categories... have fun!')
        ),
        Center(
            child: ElevatedButton(
              child: Text('Go to product list'),
              onPressed: () {
                ctx.go('/products');
              },
            )
        )
      ],
    );
  }
}