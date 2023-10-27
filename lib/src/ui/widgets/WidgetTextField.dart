import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

class WidgetTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const WidgetTextField({super.key, required this.hintText, required this.onChanged});

  @override build (BuildContext ctx) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE6E6E6),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0)
          ),
          hintStyle: MyStyles.hintText,
          hintText: hintText
      ),
      onChanged: (value) {
        EasyDebounce.debounce('product-debounce-fetch', const Duration(milliseconds: 500), () {
          onChanged(value);
        });
      }
    );
  }
}
