import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetMessageBox.dart';
import 'package:provider/provider.dart';

class WidgetBottomNavigationBar extends StatefulWidget {
  const WidgetBottomNavigationBar({super.key});
  @override
  State<WidgetBottomNavigationBar> createState() => _WidgetBottomNavigationBarState();
}

class _WidgetBottomNavigationBarState extends State<WidgetBottomNavigationBar>{
  @override
  Widget build(BuildContext ctx) {
    return Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(44), topLeft: Radius.circular(44)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(44.0),
            topRight: Radius.circular(44.0),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              switch (index) {
                case 0:
                  ctx.go('/');
                  break;
                case 1:
                  _scanCode(ctx);
                  break;
                case 2:
                  ctx.go('/cart');
                  break;
                case 3:
                  ctx.go('/user');
                  break;
              }
            },
            indicatorColor: Colors.transparent,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: MyStyles.purple,
                  size: 30,
                ),
                icon: Icon(
                  Icons.home,
                  color: MyStyles.purple,
                  size: 30,
                ),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  size: 30,
                ),
                icon: Icon(Icons.barcode_reader,
                    color: MyStyles.purple, size: 30),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.shopping_cart_outlined,
                    color: MyStyles.purple, size: 30),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.person_2_outlined,
                    color: MyStyles.purple, size: 30),
                label: '',
              ),
            ],
          ),
        ));
  }

  void _scanCode (BuildContext ctx) async {
    late final result;
    try {
      result = await BarcodeScanner.scan();
    } catch (e) {
      if (ctx.mounted) {
        WidgetMessageBox.openError(ctx, 'Ocurrió un error, vuelva a intentarlo.', Colors.red);
      }
      return;
    }

    if (ctx.mounted) {
      if (result.type == ResultType.Barcode) {
        final product = await Provider.of<ProviderProducts>(ctx, listen: false).fetchProduct(result.rawContent);

        if (ctx.mounted) {
          if (product != null) {
            Provider.of<ProviderCart>(ctx, listen: false).selectProduct(product, isScanned: true);
            ctx.go('/products/details');
          } else {
            WidgetMessageBox.openError(ctx, 'No se encontró el producto', Colors.red);
            _scanCode(ctx);
          }
        }
      } else if (result.type == ResultType.Cancelled) {
        ctx.go('/');
      } else if (result.type == ResultType.Error) {
        ctx.go('/');
        WidgetMessageBox.openError(ctx, 'Ocurrió un error al leer el código de barras', Colors.red);
      }
    }
  }
}
