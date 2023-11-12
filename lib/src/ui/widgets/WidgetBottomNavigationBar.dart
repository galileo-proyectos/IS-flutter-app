import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

class WidgetBottomNavigationBar extends StatefulWidget {
  const WidgetBottomNavigationBar({super.key});
  @override
  State<WidgetBottomNavigationBar> createState() => _WidgetBottomNavigationBarState();
}

class _WidgetBottomNavigationBarState extends State<WidgetBottomNavigationBar>{
  @override
  Widget build(BuildContext ctx) {
    return Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(44), topLeft: Radius.circular(44)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(44.0),
            topRight: Radius.circular(44.0),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              switch (index) {
                case 0:
                  ctx.go('/');
                  break;
                case 1:
                  ctx.go('/scanner');
                  break;
                case 2:
                  ctx.go('/cart');
                  break;
              }
            },
            indicatorColor: Colors.transparent,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: MyStyles.purple,
                  size: 30,
                ),
                icon: Icon(
                  Icons.home,
                  color: MyStyles.purple,
                  size: 30,
                ),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  size: 30,
                ),
                icon: Icon(Icons.barcode_reader,
                    color: MyStyles.purple, size: 30),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.shopping_cart_outlined,
                    color: MyStyles.purple, size: 30),
                label: '',
              ),
            ],
          ),
        ));
  }
}
