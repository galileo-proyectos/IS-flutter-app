import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:provider/provider.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            child: const Text('sign in'),
            // CHANGE YOUR CODE HERE
            onPressed: () async {
              // this instruction invokes signIn process
              String? errMessage = await Provider.of<ProviderUser>(ctx, listen: false).signIn('alessandro.morales@galileo.edu', 'password');
              if (errMessage == null) {
                // do something when sign in was success
                print('yes');
              } else {
                // show an error, use errMessage
                print(errMessage);
              }
            }
          )
        )
      ]
    );
  }
}