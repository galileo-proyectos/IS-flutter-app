import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetProduct.dart';
import 'package:provider/provider.dart';

class ScreenProductList extends StatefulWidget {
  ScreenProductList({super.key});

  @override
  State<ScreenProductList> createState() => _ScreenProductListState();
}

class _ScreenProductListState extends State<ScreenProductList> {
  final TextEditingController search = TextEditingController();
  late final ModelProduct product;
  @override
  void initState() {
    Provider.of<ProviderProducts>(context, listen: false)
        .fetchProducts(name: search.text);
  }

  @override
  Widget build(BuildContext ctx) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 10, left: 10, right: 10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity * 0.5,
                  child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE6E6E6),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintStyle: MyStyles.hintText,
                        hintText: "Buscar"),
                  ),
                ),
              )),
          Consumer<ProviderProducts>(builder: (ctx, provider, child) {

            return Flexible(
              flex: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.search_rounded,
                  size: 35,
                  color: MyStyles.orange,
                ),
                onPressed: () {
                  provider.fetchProducts(name: search.text);
                },
              ),
            );
          })
        ],
      ),
      Consumer<ProviderProducts>(builder: (ctx, provider, child) {
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
            provider.fetchProducts(name: search.text);
            listdewidgets.add(WidgetProduct(
              product: product,
              onPressed: () {
                // CHANGE YOR CODE HERE
                // Alessandro implement this wierd approach thinking that a supermarket
                // will have thousands of products... this is faster :D

                // first you have to selected the product
                Provider.of<ProviderProducts>(context, listen: false)
                    .selectProduct(product);
                // the you can show it's details.

                ctx.go('/products/details');
              },
            ));
            listdewidgets.add(WidgetProduct(
              product: product,
              onPressed: () {
                // CHANGE YOR CODE HERE
                // Alessandro implement this wierd approach thinking that a supermarket
                // will have thousands of products... this is faster :D

                // first you have to selected the product
                Provider.of<ProviderProducts>(context, listen: false)
                    .selectProduct(product);
                // the you can show it's details.

                ctx.go('/products/details');
              },
            ));
          }

          return Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: GridView.count(
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.65,
                crossAxisCount: 2,
                children: listdewidgets),
          ));
        }
      })
    ]);
  }
}
