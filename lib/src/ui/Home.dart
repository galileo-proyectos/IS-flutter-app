import 'package:multi_screen_app/src/providers/ProviderCategories.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState () => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState () {
    // init categories
    Provider.of<ProviderCategories>(context, listen: false).fetchCategories();
  }

  @override
  Widget build (BuildContext ctx) {
    return Consumer<ProviderCategories>(
        builder: (ctx, dataCategories, build) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text('categories\' length is : ${dataCategories.list.length}')
                ),
                Center(
                    child: ElevatedButton(
                      child: Text('fetch'),
                      onPressed: () {

                      },
                    )
                )
              ]
          );
        }
    );
  }
}