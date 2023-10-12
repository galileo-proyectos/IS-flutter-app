import 'package:flutter/material.dart';

class WidgetCheckBox extends StatefulWidget {
  const WidgetCheckBox({ super.key, required this.onChanged });

  final Function(bool value) onChanged;

  @override
  State<WidgetCheckBox> createState() => _WidgetCheckBoxState();
}

class _WidgetCheckBoxState extends State<WidgetCheckBox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Checkbox(
          value: isChecked,
          onChanged: (newBool) {
            // execute onChange callback
            widget.onChanged(isChecked = newBool == true);

            // render new state
            setState(() {
              isChecked = newBool == true;
            });
          },
        )
    );
  }
}
