import 'package:multi_screen_app/src/providers/ProviderCategories.dart';
import 'package:multi_screen_app/src/providers/ProviderPromotions.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCategoria.dart';
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
  List imgList = [
    "https://pbs.twimg.com/media/FOFIs5dXIAgxCOp.jpg:large",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_sQF818vkIirqThXQ9Mx217z2e7JoQ8oOYoX9hW5KPBS24P2M9SsBAEnrkwuUH1OfpEw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUCA5enmMppvNfS80gXooultcOuz_9FHX8Yi_EEELJl8_YzH2baCeskcI-ozseqQGC6Bc&usqp=CAU"
  ];
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
          CarouselSlider(
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
          ),
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
            return Text('loading...');
          } else {
            // here you can construct your category list
            // to finished just return the widget u want to show
            // CHANGE YOUR CODE HERE
            List<WidgetCategoria> listdewidgets = [];

            provider.list.forEach((category) {
              listdewidgets.add(WidgetCategoria(name: category.name, urlImg: category.imageURL));
            });

            return Column(children: listdewidgets);
          }
        }),
          const Padding(
            padding: EdgeInsets.all(20),
          )

      ]),
    );
  }
}
