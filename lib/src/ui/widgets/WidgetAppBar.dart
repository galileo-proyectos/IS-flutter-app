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
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: () {
                ctx.go('/products');
              },
              icon: const Icon(
                Icons.search_rounded,
                color: MyStyles.orange,
                size: 35,
              ))
        ],
        title: Align(
          alignment: Alignment.center,
          child: Image.asset("lib/src/assets/img/logo-horizontal-letras.png",
              width: 150, height: 35),
        ));
  }
}
