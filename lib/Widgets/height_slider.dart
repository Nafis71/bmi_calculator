import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class HeightSlider extends StatelessWidget {
  final int totalHeightCount, initValue;
  final bool isFeet;
  final Function(dynamic) onValueChanged;

  const HeightSlider(
      {super.key,
      required this.totalHeightCount,
      required this.initValue,
      required this.isFeet,
      required this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return WheelSlider(
      pointerColor: Colors.green,
      interval: 0.1,
      // this field is used to show decimal/double values
      totalCount: totalHeightCount,
      initValue: initValue,
      isInfinite: true,
      enableAnimation: true,
      onValueChanged: onValueChanged,
      hapticFeedbackType: HapticFeedbackType.vibrate,
    );
  }
}
