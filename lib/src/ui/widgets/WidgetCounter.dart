import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

class WidgetCounter extends StatefulWidget {
  final Function(int counter) onChanged;
  const WidgetCounter({super.key, required this.onChanged});
  @override
  State<WidgetCounter> createState() => _WidgetCounterState();
}

class _WidgetCounterState extends State<WidgetCounter> {
  int _counter = 1;

  void _increment() {
    setState(() {
      _counter++;
    });
    widget.onChanged(_counter);
  }

  void _decrement() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
    widget.onChanged(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Stack(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 2, left: 2),
                  child: Icon(Icons.remove, size: 15, color: MyStyles.breadcrumbPurple,)),
              SizedBox(
                width: 20,
                height: 20,
                child: OutlinedButton(
                  onPressed: _decrement,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFD9D9D9), ),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            alignment: Alignment.center,
            child: Text(
              "$_counter",
              style: MyStyles.h4,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Stack(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 2, left: 2),
                  child: Icon(Icons.add, size: 15, color: MyStyles.breadcrumbPurple,)),
              SizedBox(
                width: 20,
                height: 20,
                child: OutlinedButton(
                  onPressed: _increment,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
