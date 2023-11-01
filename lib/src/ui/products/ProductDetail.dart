import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCounter.dart';
import 'package:provider/provider.dart';

class ScreenProductDetail extends StatefulWidget {
  // this code will be used for finding the product
  const ScreenProductDetail({super.key});

  @override
  State<ScreenProductDetail> createState() => _ScreenProductDetailState();
}

class _ScreenProductDetailState extends State<ScreenProductDetail> {
  // this product will be read in initState
  late final ModelProduct product;

  @override
  void initState() {
    // read product
    product =
        Provider.of<ProviderProducts>(context, listen: false).selectedProduct;
  }

  @override
  Widget build(BuildContext ctx) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 8),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 35,
                color: MyStyles.purple,
              ),
              onPressed: () {
                ctx.go("/products");
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
                      padding: EdgeInsets.only(left: 45),
                      child: Text(
                        product.category.name,
                        style: MyStyles.breadcrumb,
                      ))),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: MyStyles.breadcrumbPurple,
                ),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        product.name,
                        style: MyStyles.breadcrumb,
                      ))),
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
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
            child: Text(
              product.name,
              style: MyStyles.h3_black,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
            child: Center(
              child: Text(
                product.description,
                style: MyStyles.p,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "Q${product.price}",
                style: MyStyles.h3,
              ),
            ),
          ),
          Visibility(
              visible: !Provider.of<ProviderProducts>(ctx, listen: false).isProductScanned,
              child: Center(
                child: Container(
                  width: 150,
                  child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Pasillo: ",
                                style: MyStyles.h4_orange,
                              ),
                              Text(
                                product.aisle.name,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Stock: ",
                                style: MyStyles.h4_orange,
                              ),
                              Text(
                                "  ${product.stock}",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              )),
         Visibility(
            visible:  Provider.of<ProviderProducts>(ctx, listen: false).isProductScanned,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const WidgetCounter(),
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(width: 1, color: MyStyles.orange),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.white), // Cambia el color de fondo a blanco
                    ),
                    child: const SizedBox(
                      width: 275,
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 24.0,
                            color: MyStyles.orange,
                          ),
                          Text("Agregar al carrito", style: TextStyle(color: MyStyles.orange),),
                        ],
                      ),
                    ),
                  )
                ]),
          )
        ]));
  }
}
