import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';

/// Flutter code sample for [RangeSlider].

class RangeSliderExample extends StatefulWidget {
  const RangeSliderExample({super.key});
  @override
  State<RangeSliderExample> createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _currentRangeValues = const RangeValues(1, 10000);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      activeColor: MyStyles.orange,
      values: _currentRangeValues,
      max: 10000,
      divisions:1000,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}