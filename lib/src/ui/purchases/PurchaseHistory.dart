import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPurchaseHistory extends StatelessWidget {
  const ScreenPurchaseHistory({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenPurchaseHistory')
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