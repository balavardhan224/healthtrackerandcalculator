import 'package:flutter/material.dart';
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
          onTap: () {},
        ),
      ),
      SizedBox(
        width: 95,
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
      ),
    ],
  );
}
