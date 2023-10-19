import 'package:flutter/material.dart';

class WidgetBottomNavigationBar extends StatelessWidget{
  const WidgetBottomNavigationBar({super.key});
  @override
  Widget Build(BuildContext ctx){
    return BottomNavigationBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.history, color: Color(0xFF7442A6)),
          label: 'Historial',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined, color: Color(0xFF7442A6)),
          label: 'Wishlist',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.barcode_reader, color: Color(0xFF7442A6)),
          label: 'Scanner',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined, color: Color(0xFF7442A6)),
          label: 'Carrito',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined, color: Color(0xFF7442A6)),
          label: 'Carrito',


        ),
      ],
      selectedItemColor: const Color(0xFFF58000),

    );
  }
}