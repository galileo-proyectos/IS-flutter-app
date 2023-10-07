import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenProductList extends StatelessWidget {
  const ScreenProductList({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenProductList')
        ),
        Center(
            child: ElevatedButton(
              child: const Text('Go to a product\'s page'),
              onPressed: () {
                ctx.go('/products/12345/code');
              },
            )
        )
      ],
    );
  }
}