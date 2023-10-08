import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {

  const WidgetAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context){
    return  AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        toolbarHeight: 85,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset(
            "src/assets/logo-horizontal-letras.png",
            width: 166,
            height: 100,
          ),
        ),
      );
  }
}