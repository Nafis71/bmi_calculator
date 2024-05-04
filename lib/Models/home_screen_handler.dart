import 'package:bmi_calculator/Models/person_data.dart';
import 'package:flutter/material.dart';
import '../Widgets/app_banner.dart';
import '../enums/route_enum.dart';

class HomeScreenHandler {
  static HomeScreenHandler? _instance;

  HomeScreenHandler._();

  factory HomeScreenHandler() {
    return (_instance == null) ? HomeScreenHandler._() : _instance!;
  }

  void getResult(
      {required BuildContext context,
      required bool isAgeInserted,
      required TextEditingController editingController,
      required PersonData personData}) {
    _loadResult(
        context: context,
        isAgeInserted: isAgeInserted,
        editingController: editingController,
        personData: personData);
  }

  bool getValidAge(String text) {
    return _isValidAge(text);
  }

  bool _isValidAge(String text) {
    int age = int.parse(text);
    if (age > 0 && age >= 2 && age <= 120) {
      return true;
    }
    return false;
  }

  Future _loadResult(
      {required BuildContext context,
      required bool isAgeInserted,
      required TextEditingController editingController,
      required PersonData personData}) {
    if (!isAgeInserted) {
      ScaffoldMessenger.of(context).showMaterialBanner(appBanner(
          text: "Please enter your age first",
          context: context,
          isError: false));
      return Future.value();
    }
    if (!_isValidAge(editingController.text)) {
      ScaffoldMessenger.of(context)
          .showMaterialBanner(appBanner(text: "Invalid age", context: context));
      return Future.value();
    }
    return Navigator.pushNamed(
      context,
      Routes.result.toString(),
      arguments: personData,
    );
  }
}
