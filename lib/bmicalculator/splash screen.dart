import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/Dashboard.dart';

// import 'InputPage.dart';

class Splashscreenbmi extends StatefulWidget {
  @override
  _SplashscreenStatebmi createState() => _SplashscreenStatebmi();
}

class _SplashscreenStatebmi extends State<Splashscreenbmi> {
  void Function()? get callback => null;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navigator.of(context).pop();
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.lightBlue.shade900),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: (Icon(
                          Icons.monitor_weight,
                          color: Colors.lightBlue.shade900,
                          size: 70,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                    ),
                    Text(
                      "BMI Calculator",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
