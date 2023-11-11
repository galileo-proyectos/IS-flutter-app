import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatefulWidget {

  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    testStoredJWT();
  }

  testStoredJWT () async {
    // my start code here
    final isSignedIn = await Provider.of<ProviderUser>(context, listen: false).testStoredJWT();

    if (mounted) {
      if (isSignedIn) {
        context.go('/');
      } else {
        context.go('/auth/SignIn');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen')
      )
    );
  }
}
