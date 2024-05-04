import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WeightSlider extends StatelessWidget {
  final int maxWeight, selectedWeight, weightValue;
  final Function(dynamic) onValueChanged;

  const WeightSlider(
      {super.key,
      required this.maxWeight,
      required this.selectedWeight,
      required this.weightValue,
      required this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return WheelSlider.number(
      perspective: 0.009,
      totalCount: maxWeight,
      initValue: selectedWeight,
      isInfinite: false,
      enableAnimation: true,
      selectedNumberStyle: TextStyle(
        color: (weightValue < 20) ? Colors.redAccent : Colors.green,
        fontWeight: FontWeight.w700,
        fontSize: 22.0,
      ),
      unSelectedNumberStyle: const TextStyle(
        fontSize: 14.0,
        color: Colors.black54,
      ),
      currentIndex: weightValue,
      onValueChanged: onValueChanged,
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
    );
  }
}
