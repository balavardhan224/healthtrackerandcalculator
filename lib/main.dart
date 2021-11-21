import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/Loginpage.dart';
// import 'package:healthtrackerandcalculator/Loginpage.dart';
// import 'package:healthtrackerandcalculator/homepage.dart';
// import 'package:healthtrackerandcalculator/loginwith.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}
