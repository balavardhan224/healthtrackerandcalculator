// ignore_for_file: must_be_immutable, unused_field, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthtrackerandcalculator/BottomNavigation.dart';
import 'package:healthtrackerandcalculator/Dashboard.dart';
// import 'package:chef_connect_india/Helper/models/user.dart';
import 'package:healthtrackerandcalculator/Helper/models/user.dart';
// import 'package:chef_connect_india/Main%20Screen/select_mode.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration_user extends StatefulWidget {
  // late String phonenumber;

  // Registration_user({
  //   // required this.phonenumber,
  // });

  @override
  State<Registration_user> createState() => _Registration_userState();
}

class _Registration_userState extends State<Registration_user> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final formGlobalKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "images/1.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                  child: Center(
                    child: GlassmorphicContainer(
                      width: 330,
                      height: 700,
                      borderRadius: 10,
                      blur: 0.1,
                      alignment: Alignment.bottomCenter,
                      border: 0,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.0),
                            Color(0xFFFFFFFF).withOpacity(0.0),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.0),
                          Color((0xFFFFFFFF)).withOpacity(0.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formGlobalKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 80,
                                child: LottieBuilder.asset(
                                  'images/doctor.json',
                                  height: 143.6,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                autofocus: false,
                                controller: firstNameEditingController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "First Name cannot be empty";
                                  } else if (!RegExp(r'^[a-z A-Z]+$')
                                      .hasMatch(value)) {
                                    //allow upper and lower case alphabets and space
                                    return "Space not allowed in First Name";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  firstNameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  fillColor: Colors.white70,
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white60,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              TextFormField(
                                autofocus: false,
                                controller: lastNameEditingController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                    //allow upper and lower case alphabets and space
                                    return "Enter Correct Last Name";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  lastNameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  fillColor: Colors.white70,
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white60,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              TextFormField(
                                autofocus: false,
                                controller: emailEditingController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                    return ("Please Enter Your Email");
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  emailEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  fillColor: Colors.white70,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.white60,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              // TextFormField(
                              //   autofocus: false,
                              //   controller: passwordEditingController,
                              //   obscureText: true,
                              //   validator: (value) {
                              //     RegExp regex = RegExp(r'^.{6,}$');
                              //     if (value!.isEmpty) {
                              //       return ("Password is required for login");
                              //     }
                              //     if (!regex.hasMatch(value)) {
                              //       return ("Enter Valid Password(Min. 6 Character)");
                              //     }
                              //     return null;
                              //   },
                              //   onSaved: (value) {
                              //     passwordEditingController.text = value!;
                              //   },
                              //   textInputAction: TextInputAction.next,
                              //   decoration: InputDecoration(
                              //     fillColor: Colors.white,
                              //     hintText: 'Password',
                              //     hintStyle: TextStyle(
                              //         color: Colors.black, fontSize: 15),
                              //     filled: true,
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       borderSide: BorderSide(
                              //         color: Colors.white,
                              //         width: 2,
                              //       ),
                              //     ),
                              //     focusedBorder: new OutlineInputBorder(
                              //       borderRadius:
                              //           new BorderRadius.circular(10.0),
                              //       borderSide: BorderSide(
                              //         color: Colors.white60,
                              //         width: 2,
                              //       ),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       borderSide: BorderSide(
                              //         color: Colors.white,
                              //         width: 2,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 7,
                              ),
                              // TextFormField(
                              //   autofocus: false,
                              //   controller: confirmPasswordEditingController,
                              //   obscureText: true,
                              //   validator: (value) {
                              //     if (confirmPasswordEditingController.text !=
                              //         passwordEditingController.text) {
                              //       return "Password don't match";
                              //     }
                              //     return null;
                              //   },
                              //   onSaved: (value) {
                              //     confirmPasswordEditingController.text =
                              //         value!;
                              //   },
                              //   textInputAction: TextInputAction.done,
                              //   decoration: InputDecoration(
                              //     fillColor: Colors.white,
                              //     hintText: 'Re-Enter Password',
                              //     hintStyle: TextStyle(
                              //         color: Colors.black, fontSize: 15),
                              //     filled: true,
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       borderSide: BorderSide(
                              //         color: Colors.white,
                              //         width: 2,
                              //       ),
                              //     ),
                              //     focusedBorder: new OutlineInputBorder(
                              //       borderRadius:
                              //           new BorderRadius.circular(10.0),
                              //       borderSide: BorderSide(
                              //         color: Colors.white60,
                              //         width: 2,
                              //       ),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(10),
                              //       borderSide: BorderSide(
                              //         color: Colors.white,
                              //         width: 2,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    primary: Colors.white70,
                                    side: BorderSide(
                                      color: Colors.white70,
                                      width: 2,
                                    ),
                                  ),
                                  onPressed: () {
                                    //
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      postDetailsToFirestore();
                                    }
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 18, 68, 138)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    var name =
        '${firstNameEditingController.text} ${lastNameEditingController.text}';

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    user!.updateProfile(
        displayName: name,
        photoURL:
            'https://firebasestorage.googleapis.com/v0/b/chef-connect-testing.appspot.com/o/chef-profile%2Ftyt1vei5Zlfdm2miAs90seonQt22?alt=media&token=8fcaf32d-96d0-4afa-a711-d90cf8911c9e');

    UserModel userModel = UserModel();

    // writing all the values
    userModel.uid = user.uid;
    userModel.email = emailEditingController.text;
    userModel.firstname = firstNameEditingController.text;
    userModel.lastname = lastNameEditingController.text;
    userModel.mobile1 = user.phoneNumber;
    // userModel.profilepic =
    //     'https://firebasestorage.googleapis.com/v0/b/chef-connect-testing.appspot.com/o/chef-profile%2Ftyt1vei5Zlfdm2miAs90seonQt22?alt=media&token=8fcaf32d-96d0-4afa-a711-d90cf8911c9e';

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap())
        .then((value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', user.uid);
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => Bottompage()),
          (route) => false);
    });
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}
