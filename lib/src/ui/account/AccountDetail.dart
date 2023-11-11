import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:provider/provider.dart';

class ScreenAccountDetail extends StatelessWidget {
  const ScreenAccountDetail({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenAccountDetail')
        ),
        Center(
            child: ElevatedButton(
              child: const Text('Go back'),
              onPressed: () {
                Provider.of<ProviderUser>(ctx, listen: false).signOut();
                ctx.go('/auth/signIn');
              },
            )
        )
      ],
    );
  }
}