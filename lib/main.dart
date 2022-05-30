// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthtrackerandcalculator/BottomNavigation.dart';
import 'package:healthtrackerandcalculator/Dashboard.dart';
import 'package:healthtrackerandcalculator/Doctor/Doctor_registration_1.dart';
import 'package:healthtrackerandcalculator/Doctor/doctor%20page.dart';
import 'package:healthtrackerandcalculator/Loginpage.dart';
import 'package:healthtrackerandcalculator/home.dart/button.dart';
import 'package:healthtrackerandcalculator/home.dart/login_screen.dart';
import 'package:healthtrackerandcalculator/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Helper/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 2));
}

bool doctor = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkRole();
    super.initState();
  }

  Future<void> checkRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    doctor = (pref.getBool('doctorRole') ?? true);
  }

  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Appointment Booking',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // routes: {
          // '/detailsScreen': (context) => DetailsScreen(),
          // '/mainPage': (context) => ChefConnectMain(),
          // },
          home: snapshot.connectionState != ConnectionState.done
              ? Loading()
              : StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      log('Loading');
                      return Loading();
                    } else if (doctor) {
                      if (userSnapshot.data != null) {
                        log('Logged in');
                        return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("doctors")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapShot) {
                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return Loading();
                            } else {
                              if (snapShot.hasData) {
                                return Doctor_homepage();
                              }
                              log('Has no data');
                              return doctor_registration(
                                firstname: '',
                                lastname: '',
                              );
                            }
                          },
                        );
                      }
                    } else if (!doctor) {
                      if (userSnapshot.data != null) {
                        log('Logged in');
                        return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            var data = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Loading();
                            } else {
                              if (snapshot.hasData) {
                                return Bottompage();
                              }
                              log('Has no data');
                              return Splashscreen();
                            }
                          },
                        );
                      }
                    }
                    log('UserSnapshot = null');
                    return Signin();
                  },
                ),
        );
      },
    );
  }
}
