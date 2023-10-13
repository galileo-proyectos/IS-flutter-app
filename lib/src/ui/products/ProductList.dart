import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetProduct.dart';
import 'package:provider/provider.dart';

class ScreenProductList extends StatefulWidget {
  const ScreenProductList({super.key});

  @override
  State<ScreenProductList> createState () => _ScreenProductListState();
}

class _ScreenProductListState extends State<ScreenProductList> {
  late final ModelProduct product;
  
  @override
  void initState () {
    Provider.of<ProviderProducts>(context, listen: false).fetchProducts();
  }

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetProduct(producto: product),
        const Center(
            child: Text('ScreenProductList')
        ),
        Center(
          // Because of consumer when new data is available
          // the widget will automatically be refreshed.
          // This piece is important, modify it but do not remove.
          child: Consumer<ProviderProducts>(
            builder: (ctx, provider, child) {
              if (provider.isLoading()) {
                // here you can show a loading status
                // CHANGE YOUR CODE HERE
                return Text('loading...');
              } else {
                // here you can construct your category list
                // to finished just return the widget u want to show
                // CHANGE YOUR CODE HERE
                List<Widget> listdewidgets = [];

                // [pending]: how we suppose to handle thousands of products???
                for (final product in provider.list) {
                  listdewidgets.add(ElevatedButton(
                    onPressed: () {
                      // CHANGE YOR CODE HERE
                      // Alessandro implement this wierd approach thinking that a supermarket
                      // will have thousands of products... this is faster :D

                      // first you have to selected the product

                      Provider.of<ProviderProducts>(context, listen: false).selectProduct(product);
                      // the you can show it's details.
                      ctx.go('/products/details');
                    },
                    child: Text(product.name)));
                }

                return Column(
                    children: listdewidgets
                );
              }
            }
          )
        )
      ]
    );
  }
}
