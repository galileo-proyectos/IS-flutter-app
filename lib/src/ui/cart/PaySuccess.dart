import 'package:flutter/material.dart';

import 'package:multi_screen_app/src/ui/widgets/WidgetSuccessMessage.dart';

class ScreenPaySuccess extends StatelessWidget {
  const ScreenPaySuccess({super.key});

  @override
  Widget build (BuildContext ctx) {
    return const WidgetSuccessMessage(
        message: "Su pago se ha completado con éxito.",
        btnText: "Regresar",
        route: '/');
  }
}
