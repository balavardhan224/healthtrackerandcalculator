import 'package:flutter/material.dart';

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
