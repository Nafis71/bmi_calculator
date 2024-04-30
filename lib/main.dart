import 'package:bmi_calculator/Screens/onboard_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const OnboardScreen(),
    );
  }
}
