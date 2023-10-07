import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenProductDetail extends StatelessWidget {
  ScreenProductDetail({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text('Here goes the product\' info... have fun!')
        ),
        Center(
            child: ElevatedButton(
              child: Text('Go back'),
              onPressed: () {
                ctx.go('/products');
              },
            )
        )
      ],
    );
  }
}