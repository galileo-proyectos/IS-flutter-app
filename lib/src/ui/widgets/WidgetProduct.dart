import 'package:flutter/material.dart';

import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

class WidgetProduct extends StatelessWidget {
  final ModelProduct product;
  final void Function() onPressed;

  const WidgetProduct({super.key, required this.product, required this.onPressed});

  @override
  Widget build(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          width: 150,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.imageURL,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          product.name,
                          style: MyStyles.p,
                          textAlign: TextAlign.center,
                        ))),
                Text(
                  "Q${product.price}",
                  style: MyStyles.price,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: MyStyles.smallButtonStyle,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text('Ver más', style: TextStyle(fontSize: 10),) , // <-- Text
                      SizedBox(
                        width: 5,
                      ),
                      Icon( // <-- Icon
                        Icons.arrow_forward_ios_rounded,
                        size: 11,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
