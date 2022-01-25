import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:healthtrackerandcalculator/Loginpage.dart';

Widget buildcontainer(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 150,
        width: 170,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey.shade400, width: 5),
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 10,
              offset: Offset(0, 3),
              spreadRadius: 5,
            )
          ],
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Splashscreenbmi(),
            //   ),
            // );
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
        height: 150,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.amber,
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              LottieBuilder.asset(
                'images/graph.json',
                height: 100,
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget buildbox(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 150,
        width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                25,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                blurRadius: 10,
                offset: Offset(0, 3),
                spreadRadius: 5,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Colors.red.shade400,
                Colors.redAccent.shade700,
              ],
            )),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Image.asset(
                'images/diet.png',
                height: 90,
                width: 70,
              ),
              Text(
                'Diet Planner',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        height: 150,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 10,
              offset: Offset(0, 3),
              spreadRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade300,
              Colors.deepOrange.shade400,
            ],
          ),
          color: Colors.amber,
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              LottieBuilder.asset(
                'images/weight.json',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Weight Tracker',
                style: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Roboto'),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget buildbox1(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 150,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 10,
              offset: Offset(0, 3),
              spreadRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.amber.shade400,
              Colors.amberAccent.shade700,
            ],
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              LottieBuilder.asset(
                'images/doctor consultation.json',
                height: 110,
                width: 100,
              ),
              Text(
                'Doctor consultation',
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Roboto'),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        height: 150,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 10,
              offset: Offset(0, 3),
              spreadRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.lightGreen,
              Colors.lightBlueAccent.shade700,
            ],
          ),
          color: Colors.amber,
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              LottieBuilder.asset(
                'images/Fitness.json',
                height: 110,
              ),
              Text(
                'Fitness',
                style: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Roboto'),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
