import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build (BuildContext ctx) {
    return Consumer<ModelUser>(
      builder: (ctx, user, build) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text('User token: ${user.token}')
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Click me!'),
                onPressed: () {
                  user.signIn(ModelUser('${Random().nextInt(1000)}'));
                }
              )
            )
          ]
        );
      }
    );
  }
}