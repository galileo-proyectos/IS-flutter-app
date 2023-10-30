import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderUser.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetMessageBox.dart';
import 'package:provider/provider.dart';

class ScreenSignIn extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  
  ScreenSignIn({super.key});

  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          child: Center(
            child: Image.asset(
              "lib/src/assets/img/logo-vertical-letras.png",
              height: MediaQuery.of(ctx).size.height * 0.25,
              width: MediaQuery.of(ctx).size.height * 0.25,
            ),
          ),
        ),
        Container(
            height: MediaQuery.of(ctx).size.height * 0.75,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFECDCF6),
                  Color(0xFFFFEBEE),
                  Color(0xFFFFE3D3)
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(35.0), // Ajusta el radio según lo desees
                topRight:
                    Radius.circular(35.0), // Ajusta el radio según lo desees
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 45.0, left: 45.0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Iniciar Sesion",
                    style: MyStyles.h1,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
                  child: const SizedBox(
                      height: 25,
                      width: double.infinity,
                      child: Text(
                        "Correo",
                        style: MyStyles.fieldStyle,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 45, right: 45),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintStyle: MyStyles.hintText,
                          hintText: "Ingresar correo electrónico"),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 30, bottom: 10, left: 45, right: 45),
                  child: SizedBox(
                      height: 25,
                      width: double.infinity,
                      child: Text(
                        "Contraseña",
                        style: MyStyles.fieldStyle,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintStyle: MyStyles.hintText,
                            hintText: "Ingresar contraseña"),
                      ),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(top: 10, right: 45),
                    child: InkWell(
                      child: const Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          '¿Olvidó su contraseña?',
                          style: TextStyle(
                            color: Color(0xFF592D8C),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      onTap: () async {
                        ctx.go('/auth/recovery-password');
                      },
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: ElevatedButton(
                          child: Text('Iniciar Sesión'),
                          style: MyStyles.buttonStyle,
                          // CHANGE YOUR CODE HERE
                          onPressed: () async {
                            // this instruction invokes signIn process
                            String? errMessage =
                                await Provider.of<ProviderUser>(ctx,
                                        listen: false)
                                    .signIn(email.text, password.text);
                            if (errMessage == null) {
                              // do something when sign in was success
                              //Pendiente
                              ctx.go('/');
                            } else {
                              // show an error, use errMessage
                              WidgetMessageBox.openError(ctx, errMessage,Colors.red);
                            }
                          }),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 30),
                  child: const Text(
                    "¿No tiene cuenta?",
                    style: TextStyle(color: Color(0xFF7442A6)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: ElevatedButton(
                        // UsersSignupService.signup(signupData);
                        child: const Text("Registrarse"),
                        onPressed: () {
                          ctx.go('/auth/signUp');
                        },
                        style: MyStyles.buttonStyle),
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
