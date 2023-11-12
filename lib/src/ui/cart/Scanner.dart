import 'package:flutter/material.dart';

class ScreenScanner extends StatelessWidget {
  const ScreenScanner({super.key});

  void scanCode (BuildContext ctx) async {
    // if (selectedProduct != null && ctx.mounted) {
    //   Provider.of<ProviderCart>(ctx, listen: false).selectProduct(selectedProduct, isScanned: true);
    //   ctx.go('/products/details');
    // } else {
    //   if (ctx.mounted && barcodeResult != 'exit') {
    //     scanCode(ctx);
    //   }
    // }
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