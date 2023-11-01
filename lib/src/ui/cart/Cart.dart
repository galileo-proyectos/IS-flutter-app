import 'package:flutter/material.dart';

import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCartProduct.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});
  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text(
              "Carrito",
              style: MyStyles.h2,
            )),
        WidgetCartProduct(
            imageURL:
                'https://nutriciondospinos.com/wp-content/uploads/2023/04/Leche-Pinito-Entera.png',
            name: "Leche Pinito asdgsdg asdadg asdgasd asdgasdg ",
            price: "15.3")
      ],
    ));
  }
}
