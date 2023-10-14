import 'package:flutter/material.dart';

import 'package:multi_screen_app/src/ui/widgets/WidgetSuccessMessage.dart';

class ScreenUserRecoverySuccess extends StatelessWidget {
  const ScreenUserRecoverySuccess({super.key});

  @override
  Widget build (BuildContext ctx) {
    return const WidgetSuccessMessage(
        message: "Se ha enviado un enlace a su correo electrónico.",
        btnText: "Inciar sesión",
        route: '/auth/signIn');
  }
}