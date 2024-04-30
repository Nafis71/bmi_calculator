import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({super.key, required String gender,required double height, required int weight, required bool isFeet, required bool isKg});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
