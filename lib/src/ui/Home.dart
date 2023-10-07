import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_screen_app/src/cubits/CubitUser.dart';
import 'package:multi_screen_app/src/models/ModelUser.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build (BuildContext ctx) {
    return BlocBuilder<CubitUser, ModelUser>(
      builder: (ctx, count) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(ctx.read<CubitUser>().getToken())
            ),
            Center(
                child: ElevatedButton(
                  child: Text('Go to product list'),
                  onPressed: () {
                    ctx.read<CubitUser>().signIn(ModelUser('123456789'));
                  },
                )
            )
          ],
        ),
      )
    );
  }
}