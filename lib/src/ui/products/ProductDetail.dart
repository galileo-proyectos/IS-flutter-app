import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:provider/provider.dart';

class ScreenProductDetail extends StatefulWidget {
  // this code will be used for finding the product
  const ScreenProductDetail({super.key});

  @override
  State<ScreenProductDetail> createState () => _ScreenProductDetailState();
}

class _ScreenProductDetailState extends State<ScreenProductDetail> {
  // this product will be read in initState
  late final ModelProduct product;

  @override
  void initState () {
    // read product
    product = Provider.of<ProviderProducts>(context, listen: false).selectedProduct;
  }

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          // CHANGE YOUR CODE HERE
          // you can do whatever you want, just use product.something to
          // show info about the product.
            child: Text('This is the page of ${product.name}')
        ),
        Center(
          child: ElevatedButton(
            child: const Text('Go back'),
            onPressed: () {
              ctx.go('/products');
            }
          )
        )
      ]
    );
  }
}
