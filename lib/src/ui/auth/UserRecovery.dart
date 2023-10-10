import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:provider/provider.dart';

class ScreenUserRecovery extends StatelessWidget {
  const ScreenUserRecovery({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  child: const Text('recovery password'),
                  // CHANGE YOUR CODE HERE
                  onPressed: () async {
                    // this instruction invokes recovery password process
                    String? errMessage = await Provider.of<ProviderUser>(ctx, listen: false).recoveryPassword(
                      'alessandro.morales@galileo.edu' // email
                    );
                    if (errMessage == null) {
                      // do something when the email was sent was success
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
