import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:provider/provider.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text('ScreenSignUp')
        ),
        Center(
          child: ElevatedButton(
            child: const Text('Sign up'),
            onPressed: () async {
              // this instruction invokes sign up process
              String? errMessage = await Provider.of<ProviderUser>(ctx, listen: false).signUp(
                'abcd@galileo.edu', // email
                'password', // password
                DateTime(2003, 12, 3), // born Date
                null, // phone number
                true // acceptPromotions
              );

              if (errMessage == null) {
                // do something when sign up was success
                // go to sign in form
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
