import 'package:flutter/material.dart';

class AppbarTheme{
  static getAppbarTheme() => const AppBarTheme(
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0.0,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.black,
    ),
  );
}