import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCartProduct.dart';
import 'package:provider/provider.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});
  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text(
              "Resumen",
              style: MyStyles.h2,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
            child: Container(
                width: MediaQuery.of(ctx).size.width,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(children: [
                          const Text(
                            "Productos",
                            style: TextStyle(color: Color(0xFF414141)),
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      "Q ${Provider.of<ProviderCart>(ctx, listen: false).cart.total.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                          color: Color(0xFF414141)))))
                        ]),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(children: [
                            Text("Descuentos",
                                style: TextStyle(color: Color(0xFF414141))),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("Q 66.55",
                                        style: TextStyle(
                                            color: Color(
                                                0xFF414141))) //Cambiar por descuentos
                                    ))
                          ]),
                        ),
                        const Divider(
                          color: MyStyles.orange,
                          thickness: 1.2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(children: [
                            Text(
                              "Total",
                              style: MyStyles.h4_black,
                            ),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("Q 900.00",
                                        style: MyStyles.h4_black)))
                          ]),
                        ),
                      ],
                    )))),
        const Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text(
              "Carrito",
              style: MyStyles.h2,
            )),
        Consumer<ProviderCart>(builder: (ctx, provider, child) {
          if (provider.isLoading()) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Loading...", style: MyStyles.h4),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: CircularProgressIndicator(color: MyStyles.orange),
                )
              ],
            );
          } else {
            List<Widget> addedProducts = [];
            provider.details.asMap().forEach((index, addedProduct) {
              addedProducts.add(WidgetCartProduct(
                product: addedProduct.product,
                index: index,
                quatity: addedProduct.quantity,
              ));
            });
            return Column(children: addedProducts);
          }
        }),
        const Visibility(
          visible: false,
          child: Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                "Empieza a agregar productos a tu carrito",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                    color: Color(0xFF727272)),
              )),
        ),
        Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                top: 10,
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    ctx.push('/cart/pay');
                  },
                  style: MyStyles.buttonStyle,
                  child: const Text("Pagar"),
                ),
              ),
            ))
      ],
    ));
  }
}
