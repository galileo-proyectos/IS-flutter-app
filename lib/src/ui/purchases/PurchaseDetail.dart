import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPurchaseDetail extends StatelessWidget {
  const ScreenPurchaseDetail({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenPurchaseDetail')
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