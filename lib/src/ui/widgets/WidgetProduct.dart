import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

class WidgetProduct extends StatelessWidget {
  final ModelProduct producto;

  WidgetProduct({super.key,required this.producto});

  @override
  Widget build(BuildContext ctx) {
    return Padding(padding: EdgeInsets.all(10),
    child:Container(
      width: 150,
      height: 250,
      child:Text("Hola"),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],
      ),

    ),
    );
  }
}
