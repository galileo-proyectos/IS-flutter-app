import 'package:flutter/material.dart';

class WidgetCheckBox extends StatefulWidget {
  WidgetCheckBox({ super.key, required this.onChanged, this.isChecked });

  final Function(bool value) onChanged;
  bool? isChecked = false;

  @override
  State<WidgetCheckBox> createState() => _WidgetCheckBoxState();
}

class _WidgetCheckBoxState extends State<WidgetCheckBox> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Checkbox(
          value: widget.isChecked,
          onChanged: (newBool) {
            // execute onChange callback
            widget.onChanged(widget.isChecked = newBool == true);

            // render new state
            setState(() {
              widget.isChecked = newBool == true;
            });
          },
        )
    );
  }
}
