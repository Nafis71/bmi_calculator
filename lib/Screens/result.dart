import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

late double bmi;
late int personWeight;
late double personHeight;
late String personGender;
late bool isFeetChosen, isKgChosen;

class Result extends StatefulWidget {
  Result({super.key,
    required String gender,
    required double height,
    required int weight,
    required bool isFeet,
    required bool isKg}) {
    personHeight = height;
    personGender = gender;
    personWeight = weight;
    isFeetChosen = isFeet;
    isKgChosen = isKg;
  }

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    bmi = calculateBmi();
    super.initState();
  }

  double calculateBmi() {
    if (isFeetChosen) {
      personHeight = personHeight * 0.3048;
    }
    if (!isKgChosen) {
      personWeight =
          (double.parse(personWeight.toString()) * 0.45359237).toInt();
    }
    return personWeight / pow(personHeight, 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),
        body: Column(
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.6,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3,
                  child: SfRadialGauge(
                    axes: [
                      RadialAxis(
                        minimum: 16,
                        maximum: 50,
                        maximumLabels: 5,
                        ranges: [
                          GaugeRange(
                            startValue: 16,
                            endValue: 18.4,
                            color: Colors.red,
                            startWidth: 2,
                          ),
                          GaugeRange(
                            startValue: 18.5,
                            endValue: 24.9,
                            color: Colors.green,
                          ),
                          GaugeRange(
                            startValue: 25,
                            endValue: 29.9,
                            color: Colors.yellow,
                          ),
                          GaugeRange(
                            startValue: 30,
                            endValue: 39.9,
                            color: Colors.orange,
                          ),
                          GaugeRange(
                            startValue: 40,
                            endValue: 50,
                            color: Colors.red,
                            endWidth: 2,
                          ),
                        ],
                        pointers: [
                          NeedlePointer(
                            value: bmi,
                            enableAnimation: true,
                            animationDuration: 2600,
                          )
                        ],
                        annotations: [
                          GaugeAnnotation(
                            widget: Text(
                              "${bmi.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: getColor()),
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 20,
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
                    color: Colors.blue,
                    size: 35,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            getMessage(), textAlign: TextAlign.justify,),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  MaterialColor getColor() {
    if (bmi < 18.5) {
      return Colors.red;
    } else if (bmi <= 24.9) {
      return Colors.green;
    } else if (bmi <= 29.9) {
      return Colors.yellow;
    } else if (bmi <= 39.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getMessage(){
    if (bmi < 18.5) {
      return "As a $personGender your BMI indicates that you are underweight. Consider consulting a healthcare professional for guidance on achieving a healthy weight.";
    } else if (bmi <= 24.9) {
      return "As a $personGender your BMI falls within the normal range. Keep up the healthy habits to maintain your weight and overall well-being.";
    } else if (bmi <= 29.9) {
      return "As a $personGender your BMI suggests that you are overweight. Focus on making healthy lifestyle changes, such as regular exercise and balanced nutrition, to reach a healthier weight.";
    } else if (bmi <= 39.9) {
      return "As a $personGender your BMI suggests that you are in the obesity category. Take proactive steps to improve your health and reduce your risk of obesity-related complications.";
    } else {
      return "As a $personGender your BMI indicates severe obesity, which can pose significant health risks. Seek support from healthcare professionals to address your weight and improve your overall health.";
    }
  }

}
