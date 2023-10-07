import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenProductList extends StatelessWidget {
  ScreenProductList({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text('Here goes some products... have fun!')
        ),
        Center(
            child: ElevatedButton(
              child: Text('Go to a product\'s page'),
              onPressed: () {
                ctx.go('/products/12345/code');
              },
            )
        )
      ],
    );
  }
}