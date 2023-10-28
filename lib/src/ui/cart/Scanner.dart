import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:go_router/go_router.dart';
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
      final isFound = await Provider.of<ProviderProducts>(ctx, listen: false).fetchAndSelectProduct(barcodeResult);
      if (isFound && ctx.mounted) {
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