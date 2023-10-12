import 'package:flutter/material.dart';

class WidgetMessageBox {
  static openError (BuildContext context, String message, Color color) {
    _open(context, message, color);
  }

  static _open (BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,

          content: Container(
            padding: const EdgeInsets.all(16),
            height: 90,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text (
                  'UPS!',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text (
                  message,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
    );
  }
}