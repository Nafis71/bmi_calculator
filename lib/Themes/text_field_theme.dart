import 'package:flutter/material.dart';

class TextFieldTheme {
  static getTextFieldTheme() => const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2)),
        contentPadding: EdgeInsets.all(12),
      );
}
