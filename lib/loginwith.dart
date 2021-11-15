import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/Loginpage.dart';

class Loginwith extends StatefulWidget {
  @override
  _LoginwithState createState() => _LoginwithState();
}

class _LoginwithState extends State<Loginwith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 100,
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Continue Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginpage(),
                    ),
                  );
                },
                child: Text(
                  'Login with Email',
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
