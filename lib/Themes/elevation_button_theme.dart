import 'package:flutter/material.dart';

class ElevationButtonTheme{
  static getElevationButtonTheme() => ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.00),
    ),
  );
}