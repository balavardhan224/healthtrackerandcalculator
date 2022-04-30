import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/home.dart/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('uid');
                    await FirebaseAuth.instance.signOut().then((_) {
                      Navigator.pushAndRemoveUntil(
                          (context),
                          MaterialPageRoute(builder: (context) => Signin()),
                          (route) => false);
                    });
                  },
                  child: Text(
                    'Logout',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
