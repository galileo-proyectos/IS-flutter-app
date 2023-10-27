import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override

  Widget build(BuildContext ctx) {
    bool visible = true;
    return AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        toolbarHeight: 200,
        actions: [
          IconButton(
              onPressed: () {
                ctx.go('/products');
              },
              icon: Icon(Icons.search_rounded, color: MyStyles.purple, size: 35,))
        ],
        title: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset("lib/src/assets/img/logo-horizontal-letras.png",
              width: 166, height: 40),
        )));
  }
}
