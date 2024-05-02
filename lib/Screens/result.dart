import 'dart:math';

import 'package:bmi_calculator/Models/person_data.dart';
import 'package:bmi_calculator/Screens/HomeScreenWidgets/bmi_range_adults.dart';
import 'package:bmi_calculator/Screens/HomeScreenWidgets/bmi_range_non_adults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

late double bmi;
late bool isAdult;
late PersonData personData;

class Result extends StatefulWidget {
  Result(PersonData data, {super.key}) {
    personData = data;
  }

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    (personData.age > 20) ? isAdult = true : isAdult = false;
    bmi = calculateBmi();
    super.initState();
  }

  double calculateBmi() {
    if (personData.isFeet) {
      personData.setHeight = personData.height * 0.3048;
    }
    if (!personData.isKg) {
      personData.setWeight =
          (double.parse(personData.weight.toString()) * 0.45359237).toInt();
    }
    return personData.weight / (pow(personData.height, 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your BMI Result",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    //bmi gauge meter
                    child: (isAdult)
                        ? BmiRangeAdults(personBmi: bmi)
                        : BmiRangeNonAdults(personBmi: bmi),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                        blurStyle: BlurStyle.normal,
                      )
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Icon(
                      Icons.info,
                      color: Colors.green,
                      size: 35,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            getMessage(),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                "assets/images/bmiBack.svg",
                width: 300,
                height: 200,
              ),
            ],
          ),
        ));
  }

  String getMessage() {
    if (bmi < 18.5) {
      return "As a ${personData.gender} your BMI indicates that you are underweight. Consider consulting a healthcare professional for guidance on achieving a healthy weight.";
    } else if (bmi <= 24.9) {
      return "As a ${personData.gender} your BMI falls within the normal range. Keep up the healthy habits to maintain your weight and overall well-being.";
    } else if (bmi <= 29.9) {
      return "As a ${personData.gender} your BMI suggests that you are overweight. Focus on making healthy lifestyle changes, such as regular exercise and balanced nutrition, to reach a healthier weight.";
    } else if (bmi <= 39.9) {
      return "As a ${personData.gender} your BMI suggests that you are in the obesity category. Take proactive steps to improve your health and reduce your risk of obesity-related complications.";
    } else {
      return "As a ${personData.gender} your BMI indicates severe obesity, which can pose significant health risks. Seek support from healthcare professionals to address your weight and improve your overall health.";
    }
  }
}
