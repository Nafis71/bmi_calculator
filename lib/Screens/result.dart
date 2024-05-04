import 'dart:math';
import 'package:bmi_calculator/Models/bmi_message.dart';
import 'package:bmi_calculator/Models/person_data.dart';
import 'package:bmi_calculator/Widgets/bmi_range_adults.dart';
import 'package:bmi_calculator/Widgets/bmi_range_non_adults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                ),
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
                ],
              ),
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
                          (isAdult)
                              ? BmiMessage.getMessageAdult(
                                  bmi: bmi, personData: personData)
                              : BmiMessage.getMessageNonAdult(
                                  bmi: bmi, personData: personData),
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
      ),
    );
  }
}
