import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/models/ModelProduct.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:provider/provider.dart';

class ScreenScanner extends StatelessWidget {
  const ScreenScanner({super.key});

  void scanCode (BuildContext ctx) async {
    String barcodeResult = 'exit';
    try {
      barcodeResult = await FlutterBarcodeScanner.scanBarcode(
          '#fff58000',
          'Salir',
          true,
          ScanMode.BARCODE
      );
    } on PlatformException {
      barcodeResult = 'fail';
    }
    if (ctx.mounted) {
      final ModelProduct? selectedProduct = await Provider.of<ProviderProducts>(ctx, listen: false).fetchProduct(barcodeResult);

      if (selectedProduct != null && ctx.mounted) {
        Provider.of<ProviderCart>(ctx, listen: false).selectProduct(selectedProduct, isScanned: true);
        ctx.go('/products/details');
      } else {
        if (ctx.mounted && barcodeResult != 'exit') {
          scanCode(ctx);
        }
      }
    }
  }

  @override
  Widget build (BuildContext ctx) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          scanCode(ctx);
                        },
                        child: const Text('Open Scanner')
                    )
                  ]
              )
          )
        ]
    );
  }
}