import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScreenScanner extends StatelessWidget {
  const ScreenScanner({super.key});

  @override
  Widget build (BuildContext ctx) {
    String result = '';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  var res = await Navigator.push(
                      ctx,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));

                },
                child: const Text('Open Scanner'),
              ),
              Text('Barcode Result: $result'),
            ],
          ),
        ),
      ],
    );
  }
}
