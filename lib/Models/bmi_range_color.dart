import 'package:flutter/material.dart';

class BmiRangeColor {
  static bmiRangeColorAdults(double bmi) {
    if (bmi < 18.5) {
      return Colors.red;
    }
    if (bmi <= 24.9) {
      return Colors.green;
    }
    if (bmi <= 29.9) {
      return Colors.yellow;
    }
    return Colors.orange;
  }

  static bmiRangeColorNonAdults(double bmi) {
    if (bmi < 5) {
      return Colors.red;
    }
    if (bmi <= 85) {
      return Colors.green;
    }
    if (bmi <= 95) {
      return Colors.yellow;
    }
    return Colors.red;
  }
}
