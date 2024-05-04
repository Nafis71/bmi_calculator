import 'package:flutter/material.dart';

class MetricWidget extends StatelessWidget {
  final bool checkCondition;
  final String text;
  const MetricWidget({super.key, required this.checkCondition,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color:
          (checkCondition) ? Colors.green : Colors.black),
    );
  }
}
