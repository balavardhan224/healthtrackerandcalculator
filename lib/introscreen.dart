import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/Loginpage.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:lottie/lottie.dart';

class introscreen extends StatefulWidget {
  introscreen({Key? key}) : super(key: key);

  @override
  _introscreenState createState() => _introscreenState();
}

class _introscreenState extends State<introscreen> {
  final Pages = [
    PageViewModel(
      pageColor: Colors.amber,
      mainImage: Image.asset(
        'images/bmi.png',
        height: 100,
        width: 100,
      ),
      iconImageAssetPath: 'images/bmi.png',
      body: Text('BMI Calculator'),
      title: Text('BMI Calculator'),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle(color: Colors.white),
    ),
    PageViewModel(
      pageColor: Colors.blue,
      mainImage: LottieBuilder.asset(
        'images/doctor.json',
      ),
      iconImageAssetPath: 'images/doctorconsultation.png',
      body: Text('Diet planner'),
      bodyTextStyle: TextStyle(color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => IntroViewsFlutter(
          Pages,
          showNextButton: false,
          showBackButton: true,
          onTapSkipButton: null,
          onTapDoneButton: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Loginpage()));
          },
        ),
      ),
    );
  }
}
