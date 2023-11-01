import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';

import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCartProduct.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCounter.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});
  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text(
              "Carrito",
              style: MyStyles.h2,
            )
        ),

      ],
    ));
  }
}
