import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:provider/provider.dart';

class WidgetSlideUpFilters extends StatefulWidget {
  const WidgetSlideUpFilters({super.key});

  @override
  State<WidgetSlideUpFilters> createState() => _WidgetSlideUpFiltersState();
}

class _WidgetSlideUpFiltersState extends State<WidgetSlideUpFilters> {
  @override
  Widget build (BuildContext ctx) {
    return Consumer<ProviderProducts>(builder: (ctx, provider, child) {
      if (provider.showFilters) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () {
                provider.setShowFilters(false);
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5)
                )
              )
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: const Column(
                children: [
                  // title
                  Text('Filtros')
                ]
              )
            )
          ]
        );
      } else {
        return Container();
      }
    });
  }
}
