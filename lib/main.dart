import 'package:bmi_calculator/Models/person_data.dart';
import 'package:bmi_calculator/Screens/onboard_screen.dart';
import 'package:bmi_calculator/Screens/result.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/enums/route_enum.dart';

import 'Screens/home.dart';

main() {
  runApp(DevicePreview(
      enabled: false, builder: (BuildContext context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: Routes.onboarding.toString(),
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
    );
  }

  MaterialPageRoute? generateRoute(RouteSettings routeSettings) {
    final Map<String, WidgetBuilder> routes = {
      Routes.home.toString(): (context) => const Home(),
      Routes.onboarding.toString(): (context) => const OnboardScreen(),
      Routes.result.toString(): (context) {
        PersonData personData = routeSettings.arguments as PersonData;
        return Result(personData);
      }
    };
    final WidgetBuilder? builder = routes[routeSettings.name];
    return (builder != null) ? MaterialPageRoute(builder: builder) : null;
  }
}
