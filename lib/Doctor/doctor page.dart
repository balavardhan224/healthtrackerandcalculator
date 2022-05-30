import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/home.dart/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctor_homepage extends StatefulWidget {
  Doctor_homepage({Key? key}) : super(key: key);

  @override
  State<Doctor_homepage> createState() => _Doctor_homepageState();
}

class _Doctor_homepageState extends State<Doctor_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('uid');
              await FirebaseAuth.instance.signOut().then((_) {
                Navigator.pushAndRemoveUntil(
                    (context),
                    MaterialPageRoute(builder: (context) => Signin()),
                    (route) => false);
              });
            },
            child: Text('Logout')),
      ),
    );
  }
}
