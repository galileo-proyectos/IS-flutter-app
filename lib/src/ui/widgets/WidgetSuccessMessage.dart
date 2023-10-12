import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

class WidgetSuccessMessage extends StatelessWidget {
  final String message;
  final String btnText;
  final String route;
  const WidgetSuccessMessage(
      {super.key,
      required this.message,
      required this.btnText,
      required this.route});

  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Center(
              child: Image.asset(
                "lib/src/assets/img/logo-sinletras.png",
                height: 100,
                width: 100,
                alignment: const Alignment(0, 0),
              ),
            ),
          ),
          const SizedBox(height: 20), // Distancia corta entre la imagen y la tarjeta
          Center(
              child: Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: MyStyles.purple, // Cambia el color del borde aquí
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            color: Colors.transparent, // Hace que el fondo sea transparente
            child: SizedBox(
                width: 300,
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centra verticalmente
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Centra horizontalmente
                    children: [
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Color(0xFF63d861),
                        size: 45.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50, left: 50, top: 20),
                        child: Text(
                          message,
                          style: MyStyles.messageStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              ctx.go(route);
                            },
                            style: MyStyles.buttonStyle,
                            child: Text(btnText),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )),
        ],
      ),
    );
  }
}
