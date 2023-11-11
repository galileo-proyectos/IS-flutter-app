import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetMessageBox.dart';
import 'package:provider/provider.dart';

class ScreenUserRecovery extends StatelessWidget {
  ScreenUserRecovery({super.key});
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: SizedBox(
              child: Center(
                child: Image.asset(
                  "lib/src/assets/img/logo-sinletras.png",
                  height: 100,
                  width: 100,
                  alignment: const Alignment(0, 0),
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          child: const Padding(
            padding: EdgeInsets.only(left: 45, right: 45, top: 75),
            child: Text(
              "Recuperación\nde contraseña",
              style: MyStyles.h1,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 45, right: 45),
          child: SizedBox(
              height: 25,
              width: 300,
              child: Text(
                "Ingrese su correo electrónico. Se le enviará un enlace para la recuperación de contraseña",
                style: MyStyles.p,
              )),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 45, right: 45),
          child: Center(
            child: SizedBox(
                height: 25,
                width: double.infinity,
                child: Text("Correo", style: MyStyles.fieldStyle)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Center(
            child: SizedBox(
              height: 50,
              width: double.infinity * 0.25,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintStyle: MyStyles.hintText,
                    hintText: "Ingresar correo electrónico"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                // this instruction invokes recovery password process
                String? errMessage = await Provider.of<ProviderUser>(ctx,
                        listen: false)
                    .recoveryPassword(email.text);
                if (errMessage == null) {
                  // do something when the email was sent was success
                  ctx.push('/auth/recovery-password/success');
                } else {
                  // show an error, use errMessage
                  WidgetMessageBox.openError(ctx, errMessage,Colors.red);
                }
              },
              style: MyStyles.buttonStyle,
              child: const Text("Enviar"),
            ),
          ),
        ),
      ]),
    );
  }
}
