class OnboardingModel{
  String image,title,description;

  OnboardingModel({required this.image, required this.title, required this.description});
}

List<OnboardingModel> contents = [
  OnboardingModel(
      image: "assets/images/bmi.svg",
      title: "Welcome to BMI Calculator",
      description:"BMI, or Body Mass Index, is a measure used to assess your body weight relative to your height. It's an important indicator of your overall health and can help you understand if your weight falls within a healthy range."
  ),
  OnboardingModel(
      image: "assets/images/question.svg",
      title: "Why is BMI important?",
      description:"Maintaining a healthy BMI is essential for overall well-being. Being underweight, overweight, or obese can increase the risk of various health problems, including heart disease, diabetes, and certain cancers."
  ),
  OnboardingModel(
      image: "assets/images/gettingStarted.svg",
      title: "Get Started",
      description:"Ready to take control of your health? Let's get started and discover your BMI together!"
  )
];