import 'package:bmi_calculator/Models/home_screen_handler.dart';
import 'package:bmi_calculator/Models/person_data.dart';
import 'package:bmi_calculator/Widgets/app_banner.dart';
import 'package:bmi_calculator/Widgets/custom_textfield.dart';
import 'package:bmi_calculator/Widgets/gender_container.dart';
import 'package:bmi_calculator/Widgets/header_text.dart';
import 'package:bmi_calculator/Widgets/height_slider.dart';
import 'package:bmi_calculator/Widgets/metric_widget.dart';
import 'package:bmi_calculator/Widgets/weight_slider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gender = "male";
  double _heightValue = 5.0, interval = 0.1;
  int _weightValue = 0,
      totalHeightCount = 60,
      initValue = 4,
      maxWeight = 180,
      selectedWeight = 50;
  bool isFeet = true, isKg = true, isAgeInserted = false;

  late TextEditingController _editingController;
  late HomeScreenHandler uiHandler;

  @override
  void initState() {
    _editingController = TextEditingController();
    uiHandler = HomeScreenHandler();
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
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
                    height: 15,
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.00, vertical: 10.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const HeaderText(text: "Height"),
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
                                  totalHeightCount = 60;
                                  initValue = 4;
                                });
                              },
                              splashColor: Colors.transparent,
                              child: MetricWidget(checkCondition: isFeet, text: "Feet"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isFeet = false;
                                  _heightValue = 1.0;
                                  initValue = 1;
                                  totalHeightCount =
                                      int.parse(("${2.toInt()}2"));
                                });
                              },
                              splashColor: Colors.transparent,
                              child: MetricWidget(checkCondition: !isFeet, text: "Meter"),
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
                          child: HeightSlider(
                            totalHeightCount: totalHeightCount,
                            initValue: initValue,
                            isFeet: isFeet,
                            onValueChanged: (val) {
                              setState(
                                () {
                                  if (isFeet) {
                                    _heightValue =
                                        double.parse((val + 1).toString());
                                  } else if (!isFeet) {
                                    _heightValue = val;
                                  }
                                },
                              );
                            },
                          ),
                        ),
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
                          (isFeet)
                              ? "${_heightValue.toStringAsFixed(1)} feet"
                              : "${_heightValue.toStringAsFixed(1)} meters",
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.00, vertical: 10.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const HeaderText(text: "Weight"),
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
                              child: MetricWidget(checkCondition: isKg, text: "Kg"),
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
                              child: MetricWidget(checkCondition: !isKg, text: "Pound"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: WeightSlider(
                            maxWeight: maxWeight,
                            selectedWeight: selectedWeight,
                            weightValue: _weightValue,
                            onValueChanged: (val) {
                              setState(() {
                                _weightValue = val;
                              });
                            },
                          ),
                        ),
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
                          (isKg) ? "$_weightValue Kgs" : "$_weightValue pounds",
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.00),
                        child: HeaderText(text: "Age"),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: CustomTextField.animated(
                            editingController: _editingController,
                            listOfHints: const [
                              'Enter your age',
                              'So that we can calculate',
                              'BMI according to your age',
                            ],
                            onChanged: (text) => textOnChanged(text),
                        ),
                      )
                    ],
                  )
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
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: loadResult,
                    child: const Text(
                      "Calculate BMI",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void textOnChanged(String text) {
    if (text != "") {
      isAgeInserted = true;
      (uiHandler.getValidAge(text))
          ? ScaffoldMessenger.of(context).hideCurrentMaterialBanner()
          : ScaffoldMessenger.of(context).showMaterialBanner(
              appBanner(text: "Invalid age", context: context),
            );
    } else {
      isAgeInserted = false;
    }
  }

  void loadResult() {
    uiHandler.getResult(
      context: context,
      isAgeInserted: isAgeInserted,
      editingController: _editingController,
      personData: PersonData(gender, _heightValue, _weightValue.toDouble(), isFeet, isKg,
          int.tryParse(_editingController.text) ?? 2),
    );
  }
}
