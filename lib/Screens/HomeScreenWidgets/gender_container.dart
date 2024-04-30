import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  String personGender;
  String containerGenderInfo;

  GenderContainer(
      {super.key,
      required this.personGender,
      required this.containerGenderInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        border: (containerGenderInfo == personGender)
            ? Border.all(color: Colors.green, width: 2)
            : Border.all(color: Colors.white, width: 0),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: (containerGenderInfo == personGender)
                ? Colors.green.withOpacity(0.2)
                : Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 30,
            offset: const Offset(0, 15),
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            (containerGenderInfo == "male")
                ? "assets/images/maleHead.png"
                : "assets/images/femaleHead.png",
            width: 90,
          ),
          Text(
            (containerGenderInfo == "male") ? "Male" : "Female",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
