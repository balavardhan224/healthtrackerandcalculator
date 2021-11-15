import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/bmicalculator/splash%20screen.dart';
// import 'package:healthtrackerandcalculator/Loginpage.dart';

Widget buildcontainer(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey.shade400, width: 5),
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // Colors.green,
              // Colors.blue,
              Colors.cyan,
              Colors.indigo,
            ],
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Splashscreenbmi(),
              ),
            );
          },
          child: Align(
            child: Column(
              children: [
                Image.asset(
                  'images/bmi.png',
                  height: 100,
                  width: 80,
                ),
                Text(
                  'BMI Calculator',
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'Roboto'),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          color: Colors.amber,
        ),
        child: InkWell(
          onTap: () {},
        ),
      ),
    ],
  );
}

Widget buildbox(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          color: Colors.amber,
        ),
        child: InkWell(
          onTap: () {},
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          color: Colors.amber,
        ),
        child: InkWell(
          onTap: () {},
        ),
      ),
    ],
  );
}

Widget buildbox1(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 6),
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {},
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        height: 140,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          color: Colors.amber,
        ),
        child: InkWell(
          onTap: () {},
        ),
      ),
    ],
  );
}
