import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:provider/provider.dart';

class ScreenProductList extends StatefulWidget {
  const ScreenProductList({super.key});

  @override
  State<ScreenProductList> createState () => _ScreenProductListState();
}

class _ScreenProductListState extends State<ScreenProductList> {
  @override
  void initState () {
    Provider.of<ProviderProducts>(context, listen: false).fetchProducts();
  }

  @override
  Widget build (BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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

                for (final product in provider.list) {
                  listdewidgets.add(Text(product.name));
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
