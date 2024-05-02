import 'package:flutter/material.dart';

MaterialBanner appBanner(
    {required String text, required BuildContext context}) {
  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  return MaterialBanner(
      backgroundColor: Colors.red.shade400,
      elevation: 5,
      content: Padding(
        padding: const EdgeInsets.all(10.00),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      onVisible: () {
        Future.delayed(const Duration(seconds: 3),
            () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner());
      },
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: const Text(
            "Close",
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ]);
}
