import 'package:bmi_calculator/Models/person_data.dart';

class BmiMessage {
  static getMessageAdult(
      {required double bmi, required PersonData personData}) {
    if (bmi < 18.5) {
      return "As an adult ${personData.gender} your BMI indicates that you are underweight. Consider consulting a healthcare professional for guidance on achieving a healthy weight.";
    }
    if (bmi <= 24.9) {
      return "As an adult ${personData.gender} your BMI falls within the normal range. Keep up the healthy habits to maintain your weight and overall well-being.";
    }
    if (bmi <= 29.9) {
      return "As an adult ${personData.gender} your BMI suggests that you are overweight. Focus on making healthy lifestyle changes, such as regular exercise and balanced nutrition, to reach a healthier weight.";
    }
    if (bmi <= 39.9) {
      return "As an adult ${personData.gender} your BMI suggests that you are in the obesity category. Take proactive steps to improve your health and reduce your risk of obesity-related complications.";
    }
    return "As an adult ${personData.gender} your BMI indicates severe obesity, which can pose significant health risks. Seek support from healthcare professionals to address your weight and improve your overall health.";
  }

  static getMessageNonAdult(
      {required double bmi, required PersonData personData}) {
    if (bmi < 5) {
      return "As a non adult ${personData
          .gender} your BMI indicates that you are underweight. Consider consulting a healthcare professional for guidance on achieving a healthy weight.";
    }
    if (bmi <= 85) {
      return "As a non adult ${personData
          .gender} your BMI falls within the normal range. Keep up the healthy habits to maintain your weight and overall well-being.";
    }
    if (bmi <= 95) {
      return "As a non adult ${personData
          .gender} your BMI suggests that you are At risk of overweight. Focus on making healthy lifestyle changes, such as regular exercise and balanced nutrition, to reach a healthier weight.";
    }
    return "As a non adult ${personData
        .gender} your BMI suggests that you are overweight. Focus on making healthy lifestyle changes, such as regular exercise and balanced nutrition, to reach a healthier weight.";
  }
}
