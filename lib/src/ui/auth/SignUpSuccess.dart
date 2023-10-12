import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetSuccessMessage.dart';

class ScreenSignUpSuccess extends StatelessWidget {
  const ScreenSignUpSuccess({super.key});

  @override
  Widget build (BuildContext ctx) {
    return  const WidgetSuccessMessage(
        message: "Se ha registrado su cuenta exitosamente",
        btnText: "Iniciar sesión",
        route: '/auth/signIn');
  }
}