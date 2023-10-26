import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
class WidgetBottomNavigationBar extends StatelessWidget {
  const WidgetBottomNavigationBar({super.key});
  @override
  Widget build (BuildContext ctx) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        switch(index){
          case 0:
            ctx.go('/');
            break;
          case 1:
            ctx.go('/scanner');
            break;
          case 2:
            ctx.go('/cart');
            break;
          case 3:
            ctx.go('/user/details');
            break;
        }
      },
      indicatorColor: Colors.transparent,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home, color: MyStyles.purple),
          icon: Icon(Icons.home, color: MyStyles.purple,),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.barcode_reader, color: MyStyles.purple),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.shopping_cart_outlined, color: MyStyles.purple),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.person_2_outlined, color: MyStyles.purple),
          label: '',
        ),
      ],
    );
  }
}