import 'package:bmi_calculator/Screens/HomeScreenWidgets/gender_container.dart';
import 'package:bmi_calculator/Screens/result.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wheel_slider/wheel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gender = "male";
  double _heightValue = 5.0, interval = 0.1;
  int _weightValue = 0,
      totalCount = 40,
      minHeight = 2,
      maxWeight = 180,
      selectedWeight = 50;
  bool isFeet = true, isKg = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.filter,
                size: 30,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () => setState(() => gender = "male"),
                        child: GenderContainer(
                          personGender: gender,
                          containerGenderInfo: "male",
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () => setState(() => gender = "female"),
                        child: GenderContainer(
                          personGender: gender,
                          containerGenderInfo: "female",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isFeet = true;
                                  _heightValue = 5.0;
                                  interval = 0.1;
                                  totalCount = 40;
                                  minHeight = 2;
                                });
                              },
                              splashColor: Colors.transparent,
                              child: Text(
                                "Feet",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: (isFeet) ? Colors.green : Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isFeet = false;
                                  _heightValue = 0.1;
                                  minHeight = 1;
                                  totalCount = int.parse(("${2.toInt()}0"));
                                });
                              },
                              splashColor: Colors.transparent,
                              child: Text(
                                "Meter",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      (!isFeet) ? Colors.green : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: WheelSlider(
                            pointerColor: Colors.green,
                            interval: 0.1,
                            // this field is used to show decimal/double values
                            totalCount: totalCount,
                            initValue: minHeight,
                            isInfinite: true,
                            enableAnimation: true,
                            onValueChanged: (val) {
                              setState(() {
                                if (isFeet) {
                                  _heightValue =
                                      double.parse((val + 3).toString());
                                } else if (!isFeet) {
                                  _heightValue = val;
                                }
                              });
                            },
                            hapticFeedbackType: HapticFeedbackType.vibrate,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          (isFeet) ? "${_heightValue.toStringAsFixed(1)} feet":"${_heightValue.toStringAsFixed(1)} meters",
                          style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isKg = true;
                                  maxWeight = 180;
                                  selectedWeight = 50;
                                });
                              },
                              splashColor: Colors.transparent,
                              child: Text(
                                "Kg",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        (isKg) ? Colors.green : Colors.black),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isKg = false;
                                  maxWeight = 397;
                                  selectedWeight = 110;
                                });
                              },
                              splashColor: Colors.transparent,
                              child: Text(
                                "Pound",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        (!isKg) ? Colors.green : Colors.black),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: WheelSlider.number(
                            perspective: 0.009,
                            totalCount: maxWeight,
                            initValue: selectedWeight,
                            isInfinite: false,
                            enableAnimation: true,
                            selectedNumberStyle: TextStyle(
                              color: (_weightValue < 20)
                                  ? Colors.redAccent
                                  : Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0,
                            ),
                            unSelectedNumberStyle: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                            ),
                            currentIndex: _weightValue,
                            onValueChanged: (val) {
                              setState(() {
                                _weightValue = val;
                              });
                            },
                            hapticFeedbackType: HapticFeedbackType.heavyImpact,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [Icon(Ionicons.caret_up)],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          (isKg) ? "$_weightValue Kgs":"$_weightValue pounds",
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.00))),
                    onPressed: () {
                      loadResult(context: context);
                    },
                    child: const Text(
                      "Calculate BMI",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future loadResult({required BuildContext context}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Result(
                gender: gender,
                height: _heightValue,
                weight: _weightValue,
                isFeet: isFeet,
                isKg: isKg)));
  }
}
