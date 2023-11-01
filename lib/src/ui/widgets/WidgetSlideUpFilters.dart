import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/providers/ProviderCategories.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetCheckBox.dart';
import 'package:provider/provider.dart';

class WidgetSlideUpFilters extends StatefulWidget {
  const WidgetSlideUpFilters({super.key});

  @override
  State<WidgetSlideUpFilters> createState() => _WidgetSlideUpFiltersState();
}

class _WidgetSlideUpFiltersState extends State<WidgetSlideUpFilters> {
  @override
  void initState() {
    // init categories
    Provider.of<ProviderCategories>(context, listen: false).fetchCategories();
  }

  @override
  Widget build (BuildContext superCtx) {
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
                        width: MediaQuery.of(ctx).size.width,
                        height: MediaQuery.of(ctx).size.height,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5)
                        )
                    )
                ),
                Container(
                    width: MediaQuery.of(superCtx).size.width,
                    height: MediaQuery.of(superCtx).size.height * 0.5,

                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                        )
                    ),
                    child:  SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // title
                            const Padding(padding: EdgeInsets.only(left:35, top:35),
                                child: Text("Filtros", style:MyStyles.h2)),
                            const Padding(padding: EdgeInsets.only(left: 45, top: 15, bottom:15),
                                child: Text("Categoría", style:MyStyles.h3)),
                            Consumer<ProviderCategories>(builder: (ctx, provider, child) {
                              return Consumer<ProviderProducts>(builder: (ctx, providerPro, child) {
                                if (provider.isLoading()) {
                                  // here you can show a loading status
                                  // CHANGE YOUR CODE HERE
                                  return const Text('loading...');
                                } else {
                                  // here you can construct your category list
                                  // to finished just return the widget u want to show
                                  // CHANGE YOUR CODE HERE
                                  final List<Container> widgetList = [];

                                  for (final category in provider.list) {
                                    widgetList.add(Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 35),
                                            child: WidgetCheckBox(isChecked: providerPro.categoryIdsFilter.contains(category.id),onChanged: (value) {
                                              if (value) {
                                                providerPro.addCategoryIdsFilter(category.id);
                                              } else {
                                                providerPro.removeCategoryIdsFilter(category.id);
                                              }
                                              providerPro.fetchProducts();
                                            })
                                          ),
                                          Text(category.name)
                                        ])
                                      )
                                    ));
                                  }

      //const Padding(padding: EdgeInsets.only(top:15, left: 35),
      //child:  Text("Rango de Precios", style:MyStyles.h3)),
      //const Padding(padding: EdgeInsets.only(top:15, left: 15, right: 15),
      // child: RangeSliderExample(),),
                                  return Column(children: widgetList);
                                }
                              });
                            })
                          ]
                      ),
                    )
                ),
              ]
          );
        } else {
          return Container();
        }
      });
  }
}
