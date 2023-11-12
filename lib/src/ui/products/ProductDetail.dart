import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCounter.dart';
import 'package:provider/provider.dart';

class ScreenProductDetail extends StatefulWidget {
  int quantity = 1;
  ScreenProductDetail({super.key});

  @override
  State<ScreenProductDetail> createState() => _ScreenProductDetailState();
}

class _ScreenProductDetailState extends State<ScreenProductDetail> {
  // this product will be read in initState
  late final ModelProduct product;

  @override
  void initState() {
    // read product
    product = Provider.of<ProviderCart>(context, listen: false).selectedProduct;
  }

  @override
  void deactivate() {
    // clear product
    Provider.of<ProviderCart>(context, listen: false).unselectProduct();
  }

  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 8),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 35,
                color: MyStyles.purple,
              ),
              onPressed: () {
                ctx.pop();
              },
            ),
          ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<ProviderProducts>(ctx, listen: false)
                          .setCategoryIdsFilter([product.category.id]);
                      ctx.go('/products');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(
                        product.category.name,
                        style: MyStyles.breadcrumb,
                        softWrap: true,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: MyStyles.breadcrumbPurple,
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 250,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          product.name,
                          style: MyStyles.breadcrumb,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 280,
                  height: 280,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 2,
                            offset: const Offset(0, 0)),
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.imageURL,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                product.name,
                style: MyStyles.h3_black,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
            child: Center(
              child: Text(
                product.description,
                style: MyStyles.p,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "Q${product.price.toStringAsFixed(2)}",
                style: MyStyles.h3,
              ),
            ),
          ),
          Visibility(
              visible: !Provider.of<ProviderCart>(ctx, listen: false)
                  .isProductScanned,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Pasillo: ",
                            style: MyStyles.h4_orange,
                          ),
                          Text(
                            product.aisle.name,
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Stock: ",
                            style: MyStyles.h4_orange,
                          ),
                          Text(
                            "  ${product.stock}",
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Visibility(
            visible:true,
                //Provider.of<ProviderCart>(ctx, listen: false).isProductScanned,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidgetCounter(
                    onChanged: (int counter) {
                      widget.quantity = counter;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(children: [
                      Visibility(
                          visible:
                              !Provider.of<ProviderCart>(ctx, listen: false)
                                  .isProductInCart,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Provider.of<ProviderCart>(ctx, listen: false)
                                    .addDetail(widget.quantity.toDouble());
                              });
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                      width: 1, color: MyStyles.orange),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            child: const Column(
                              children: [
                                SizedBox(
                                  width: 275,
                                  height: 55,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 24.0,
                                        color: MyStyles.orange,
                                      ),
                                      Text(
                                        "Agregar al carrito",
                                        style:
                                            TextStyle(color: MyStyles.orange),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      Visibility(
                          visible: Provider.of<ProviderCart>(ctx, listen: false)
                              .isProductInCart,
                          child: ElevatedButton(
                            onPressed: () {
                              //
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(MyStyles.orange),
                            ),
                            child: const Column(
                              children: [
                                SizedBox(
                                  width: 275,
                                  height: 55,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_rounded,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Añadido al carrito",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ]),
                  ),
                ]),
          )
        ]));
  }
}
