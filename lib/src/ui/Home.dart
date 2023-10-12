import 'package:multi_screen_app/src/providers/ProviderCategories.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext ctx) {
    // CHANGE YOUR CODE HERE
    // you may want to place the hole structure of this screen here,
    // but first go to check above messages
    return SingleChildScrollView(
        child: Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xFFFCFAFA),
                Color(0xFFDACFE8)])),
      child: Column(children: [
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
            List<Widget> listdewidgets = [];

            provider.list.forEach((category) {
              listdewidgets.add(Text(category.name));
            });

            return Column(children: listdewidgets);
          }
        }),
      ]),
    ));
  }
}
