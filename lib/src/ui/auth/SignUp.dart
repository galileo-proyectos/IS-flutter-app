import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:date_field/date_field.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCheckBox.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetMessageBox.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  DateTime bornDate = DateTime(0);
  bool acceptPromotions = false;
  bool acceptTerms = false;
  bool showErrors = false;

  @override
  Widget build(BuildContext ctx) {
    return Form(
      child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 45, top: 75),
                  child: Text("Registro", style: MyStyles.h1),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 120, top: 40),
                    child: Image.asset("lib/src/assets/img/logo-sinletras.png",
                        height: 80, width: 80))
              ],
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 45, right: 45),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    child: Text("Correo", style: MyStyles.fieldStyle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
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
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 45, right: 45),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    child: Text("Contraseña", style: MyStyles.fieldStyle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintStyle: MyStyles.hintText,
                        hintText: "Ingresar contraseña"),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 45, right: 45),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    child: Text("Confirmación de Contraseña",
                        style: MyStyles.fieldStyle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    obscureText: true,
                    controller: confirmPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintStyle: MyStyles.hintText,
                        hintText: "Ingresar confirmación de contraseña"),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 45, right: 45),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    child: Text("Fecha de Nacimiento",
                        style: MyStyles.fieldStyle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: DateTimeFormField(
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black54),
                            errorStyle:
                                const TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Ingresa tu fecha de nacimiento"),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {
                          bornDate = value;
                        },
                      ),
                    )),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 45, right: 45),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    child: Text("Teléfono", style: MyStyles.fieldStyle)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintStyle: MyStyles.hintText,
                        hintText: "Ingresar tu número de teléfono"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: WidgetCheckBox(onChanged: (value) {
                    acceptPromotions = value;
                  }),
                ),
                const Text("Acepto recibir promociones por correo")
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: WidgetCheckBox(onChanged: (value) {
                   acceptTerms = value;
                  }),
                ),
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      'Acepto los términos y condiciones',
                      style: TextStyle(
                        color: Color(0xFFF58000),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  onTap: () async {
                    //on tap code here, you can navigate to other page or URL
                    String url = "https://www.fluttercampus.com"; // PENDIENTE
                    bool urllaunchable = await canLaunch(
                        url); //canLaunch is from url_launcher package
                    if (urllaunchable) {
                      await launch(
                          url); //launch is from url_launcher package to launch URL
                    }
                  },
                )
              ]),
            ),
            Center(
                child: ElevatedButton(
                    child: Text('Registrarse'),
                    style: MyStyles.buttonStyle,
                    onPressed: () async {
                      String? errMessage="";
                      if (password.value == confirmPassword.value) {
                        if(acceptTerms){
                          errMessage =
                          await Provider.of<ProviderUser>(ctx, listen: false)
                              .signUp(
                              email.text, // email
                              password.text, // password
                              bornDate, // born Date
                              phone.text, // phone number
                              acceptPromotions // acceptPromotions
                          );
                        }else{
                          errMessage = "Aceptar los Términos y Condiciones";
                        }
                      } else {
                        errMessage = "$errMessage Password doesn't matched";
                      }
                      // this instruction invokes sign up process

                      if (errMessage == null) {
                        // do something when sign up was success
                        // go to sign in form

                        ctx.go('/auth/signUp/success');
                      } else {
                        // show an error, use errMessage
                        WidgetMessageBox.openError(ctx, errMessage,Colors.red);
                        print(errMessage);
                      }
                    })),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: Center(
                  child: Text(
                "¿Ya tiene cuenta?",
                style: TextStyle(color: MyStyles.purple),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    ctx.go('/auth/signIn');
                  },
                  style: MyStyles.buttonStyle,
                  child: const Text("Iniciar sesión"),
                ),
              ),
            )
          ])),
    );
  }
}
