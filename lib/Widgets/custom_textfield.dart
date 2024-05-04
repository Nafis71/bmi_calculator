import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController editingController;
  final List<String> listOfHints;
  final Function(dynamic) onChanged;

  const CustomTextField.animated(
      {super.key,
      required this.editingController,
      required this.listOfHints,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextField(
      style: const TextStyle(fontSize: 18),
      cursorColor: Colors.green,
      controller: editingController,
      keyboardType: TextInputType.number,
      animationType: Animationtype.typer,
      hintTextStyle: const TextStyle(
        color: Colors.black,
        overflow: TextOverflow.ellipsis,
      ),
      cursorOpacityAnimates: true,
      hintTexts: listOfHints,
      onChanged: onChanged,
    );
  }
}
