import 'package:flutter/material.dart';

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
                onPressed: () async {},
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
