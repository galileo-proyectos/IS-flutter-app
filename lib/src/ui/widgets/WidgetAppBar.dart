import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      toolbarHeight: 200,
      title: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            "lib/src/assets/img/logo-horizontal-letras.png",
            width: 166,
            height: 40
          ),
        )
      )
    );
  }
}
