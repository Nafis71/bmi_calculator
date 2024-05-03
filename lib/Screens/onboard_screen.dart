import 'package:bmi_calculator/enums/route_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bmi_calculator/Models/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  late final SharedPreferences preferences;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    initializeSharedPreference();
    super.initState();
  }

  Future<void> initializeSharedPreference() async {
    preferences = await SharedPreferences.getInstance();
    bool? hasSeenOnboard = preferences.getBool("hasSeenOnboard");
    if (hasSeenOnboard != null) {
      skipScreen();
    }
  }

  void skipScreen() {
    Navigator.pushReplacementNamed(context, Routes.home.toString());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Column(children: [
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) => Padding(
                    padding: const EdgeInsets.all(20.00),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                _pageController.jumpToPage(contents.length - 1);
                              },
                              splashColor: Colors.transparent,
                              child: Text(
                                (currentIndex == contents.length - 1)
                                    ? ""
                                    : "Skip",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: SvgPicture.asset(
                            contents[i].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[i].title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                pageController();
              },
              child: Text(
                (currentIndex == contents.length - 1)
                    ? "Get Started"
                    : "Continue",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]);
      },
    ));
  }

  void pageController() {
    if (currentIndex == contents.length - 1) {
      setPreference();
      Navigator.pushReplacementNamed(context, Routes.home.toString());
    }
    _pageController.nextPage(
        duration: const Duration(milliseconds: 1000), curve: Curves.bounceOut);
  }

  Future<void> setPreference() async{
    preferences.setBool("hasSeenOnboard", true);
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: (currentIndex == index) ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
    );
  }
}
