import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderCategories.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/providers/ProviderPromotions.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCategory.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    // init categories
    Provider.of<ProviderCategories>(context, listen: false).fetchCategories();
    Provider.of<ProviderPromotions>(context, listen: false).fetchPromotions();
  }
  @override
  Widget build(BuildContext ctx) {
    // CHANGE YOUR CODE HERE
    // you may want to place the hole structure of this screen here,
    // but first go to check above messages
    return SingleChildScrollView(
        child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text("Promociones", style: MyStyles.h3),
          ),
        ),

          Consumer<ProviderPromotions>(builder: (ctx, provider, child) {
            if (provider.isLoading()) {
              // here you can show a loading status
              // CHANGE YOUR CODE HERE
              return Text('loading...');
            } else {
              // here you can construct your category list
              // to finished just return the widget u want to show
              // CHANGE YOUR CODE HERE
              final List<String> imgList = [];

              for (final promotion in provider.list) {
                imgList.add(promotion.imageURL);
              }

              return CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 400,
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map((item) => Container(
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 270)),
                    )))
                    .toList(),
              );
            }
          }),

        Container(
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Text("¿Qué deseas comprar hoy?", style: MyStyles.h3),
          ),
        ),
        Consumer<ProviderCategories>(builder: (ctx, provider, child) {
          if (provider.isLoading()) {
            // here you can show a loading status
            // CHANGE YOUR CODE HERE
            return const Text('loading...');
          } else {
            // here you can construct your category list
            // to finished just return the widget u want to show
            // CHANGE YOUR CODE HERE
            final List<WidgetCategory> widgetList = [];

            for (final category in provider.list) {
              widgetList.add(WidgetCategory(
                name: category.name,
                urlImg: category.imageURL,
                onTap: () {
                  Provider.of<ProviderProducts>(ctx, listen: false).setCategoryIdsFilter([category.id]);
                  ctx.go('/products');
                }
              ));
            }

            return Column(children: widgetList);
          }
        }),
          const Padding(
            padding: EdgeInsets.all(20)
          )
      ])
    );
  }
}
