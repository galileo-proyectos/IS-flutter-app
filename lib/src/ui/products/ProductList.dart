import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetProduct.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetTextField.dart';
import 'package:provider/provider.dart';

class ScreenProductList extends StatefulWidget {
  const ScreenProductList({super.key});

  @override
  State<ScreenProductList> createState() => _ScreenProductListState();
}

class _ScreenProductListState extends State<ScreenProductList> {
  @override
  void initState() {
    Provider.of<ProviderProducts>(context, listen: false).initProductList();
  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Flexible(
                  flex: 6,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 10, left: 10, right: 10),
                      child: SizedBox(
                          height: 50,
                          width: double.infinity * 0.5,
                          child: WidgetTextField(
                            hintText: 'Buscar',
                            onChanged: (String value) {
                              print(DateTime.now());
                              Provider.of<ProviderProducts>(context, listen: false).nameFilter.text = value;
                              Provider.of<ProviderProducts>(context, listen: false).fetchProducts();
                            }
                          )
                      )
                  )),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.filter_alt,
                    size: 35,
                    color: MyStyles.orange
                  ),
                  onPressed: () {
                    // Provider.of<ProviderProducts>(ctx, listen: false).fetchProducts();
                    Provider.of<ProviderProducts>(ctx, listen: false).setShowFilters(true);

                    // hide keyboard
                    FocusManager.instance.primaryFocus?.unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                )
              )
            ]),
          Consumer<ProviderProducts>(builder: (ctx, provider, child) {
            if (provider.isLoading()) {
              // here you can show a loading status
              // CHANGE YOUR CODE HERE
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Loading...", style: MyStyles.h1),
                  CircularProgressIndicator(color: MyStyles.orange)
                ]
              );
            } else {
              // here you can construct your category list
              // to finished just return the widget u want to show
              // CHANGE YOUR CODE HERE
              List<Widget> widgetList = [];

              // [pending]: how we suppose to handle thousands of products???
              for (final product in provider.list) {
                widgetList.add(WidgetProduct(
                    product: product,
                    onPressed: () {
                      // CHANGE YOR CODE HERE
                      // Alessandro implement this wierd approach thinking that a supermarket
                      // will have thousands of products... this is faster :D

                      // first you have to selected the product
                      Provider.of<ProviderProducts>(context, listen: false).selectProduct(product);
                      // the you can show it's details.
                      ctx.go('/products/details');
                    }
                ));
              }

              return Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: GridView.count(mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 0.6, crossAxisCount: 2, children: widgetList)));
            }
          })
        ])
    );
  }
}
