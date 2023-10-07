import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenProductDetail extends StatelessWidget {
  const ScreenProductDetail({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenProductDetail')
        ),
        Center(
            child: ElevatedButton(
              child: const Text('Go back'),
              onPressed: () {
                ctx.go('/products');
              },
            )
        )
      ],
    );
  }
}