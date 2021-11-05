import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/bmicalculator/splash%20screen.dart';
// import 'package:healthtrackerandcalculator/Loginpage.dart';

Widget buildcontainer(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 120,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          color: Colors.amber,
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
        ),
      ),
      SizedBox(
        width: 85,
      ),
      Container(
        height: 120,
        width: 130,
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
        height: 120,
        width: 130,
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
        width: 80,
      ),
      Container(
        height: 120,
        width: 130,
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
        height: 120,
        width: 130,
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
        width: 80,
      ),
      Container(
        height: 120,
        width: 130,
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
