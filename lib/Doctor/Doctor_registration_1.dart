// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:chef_connect_india/roles/chef/chef_registration_2.dart';
// import 'package:healthtrackerandcalculator/Doctor/Doctor_registration_1.dart';
import 'package:healthtrackerandcalculator/Doctor/Doctor_registration_2.dart';
import 'package:healthtrackerandcalculator/Doctor/doctor%20page.dart';
import 'package:lottie/lottie.dart';

import '../Helper/models/doctor.dart';

class doctor_registration extends StatefulWidget {
  final String firstname;
  final String lastname;
  // final String phonenumber;
  // final int workexperience;
  // final String worklocation;
  // final String currentlocation;
  doctor_registration({
    required this.firstname,
    required this.lastname,
    // required this.phonenumber,
  });
  // final String phonenumber;
  // doctor_registration({required this.phonenumber});

  @override
  State<doctor_registration> createState() => _doctor_registrationState();
}

class _doctor_registrationState extends State<doctor_registration> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final formGlobalKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final workExperienceEditingController = new TextEditingController();
  final salaryEditingController = new TextEditingController();
  final professionEditingContorller = new TextEditingController();
  final emailEditingController = new TextEditingController();
  // final worklocationEditingController = new TextEditingController();
  // final currentlocationEditingController = new TextEditingController();

  // final worklocation = ['Jaipur', 'Bangalore'];
  // final workType = ['Party Chef', 'Kitchen Professional', 'Private Chef'];
  // String? locValue;
  // String? cheftypeValue;
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        // padding: const EdgeInsets.all(8.0),
                        key: formGlobalKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white70,
                                radius: 80,
                                child: LottieBuilder.asset(
                                  'images/doctor consultation.json',
                                  height: 140,
                                ),
                              ),
                            ),

                            // firstNameField,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: firstNameEditingController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value)) {
                                    //allow upper and lower case alphabets and space
                                    return "Enter Correct First Name";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  firstNameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
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
                                      color: Colors.white,
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
                            ),

                            // secondNameField,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: lastNameEditingController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (lastNameEditingController.text.isEmpty) {
                                    return "*Required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  lastNameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15),
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
                                      color: Colors.white,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: emailEditingController,
                                keyboardType: TextInputType.name,
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
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15),
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
                                      color: Colors.white,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: professionEditingContorller,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (professionEditingContorller
                                      .text.isEmpty) {
                                    return "*Required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  professionEditingContorller.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Profession',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'Profession',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15),
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
                                      color: Colors.white,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: salaryEditingController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (salaryEditingController.text.isEmpty) {
                                    return "*Required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  salaryEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Fees per patient',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'Fees per patient',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15),
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
                                      color: Colors.white,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: false,
                                controller: workExperienceEditingController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (workExperienceEditingController
                                      .text.isEmpty) {
                                    return "*Required";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  workExperienceEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: 'Experience',
                                  labelStyle: TextStyle(
                                      backgroundColor: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  prefixIcon: Icon(Icons.account_circle),
                                  fillColor: Colors.white,
                                  hintText: 'Eperience',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 15),
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
                                      color: Colors.white,
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
                            ),
                            // signUpButton
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 45,
                                width: 200,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      try {
                                        postDetailsToFirestore()
                                            .catchError((e) {
                                          Fluttertoast.showToast(
                                              msg: e!.message);
                                        });
                                      } on FirebaseAuthException catch (error) {
                                        switch (error.code) {
                                          case "invalid-phone":
                                            errorMessage =
                                                "Your phone number appears to be malformed.";
                                            break;
                                          case "user-not-found":
                                            errorMessage =
                                                "User with this email doesn't exist.";
                                            break;
                                          case "user-disabled":
                                            errorMessage =
                                                "User with this email has been disabled.";
                                            break;
                                          case "too-many-requests":
                                            errorMessage = "Too many requests";
                                            break;
                                          // case "operation-not-allowed":
                                          //   errorMessage =
                                          //       "Signing in with Email and Password is not enabled.";
                                          //   break;
                                          default:
                                            errorMessage =
                                                "An undefined Error happened.";
                                        }
                                        Fluttertoast.showToast(
                                            msg: errorMessage!);
                                        print(error.code);
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 18, 68, 138)),
                                  ),
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
          ],
        ),
      ),
    );
  }

//   DropdownMenuItem<String> buildMenuItem(String worklocation) =>
//       DropdownMenuItem(
//         value: worklocation,
//         child: Text(
//           worklocation,
//           style: TextStyle(fontSize: 18),
//         ),
//       );
// }

// mixin InputValidationMixin {
//   bool isPasswordValid(String password) => password.length == 6;

//   bool islastNameValid(String lastname) {
//     Pattern lnpattern = '.{3,}';
//     RegExp regex = new RegExp(lnpattern.toString());
//     return regex.hasMatch(lastname);
//   }

//   bool isEmailValid(String email) {
//     Pattern pattern =
//         '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
//     RegExp regex = new RegExp(pattern.toString());
//     return regex.hasMatch(email);
//   }
// }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    var name = '${widget.firstname} ${widget.lastname}';
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    user!.updateProfile(displayName: name);

    DoctorModel doctorModel = DoctorModel();

    // writing all the values
    doctorModel.uid = user.uid;
    // doctorModel.email = emailEditingController.text;
    doctorModel.firstname = firstNameEditingController.text;
    doctorModel.lastname = lastNameEditingController.text;
    doctorModel.email = emailEditingController.text;
    doctorModel.mobile1 = user.phoneNumber;
    doctorModel.salary = salaryEditingController.text;
    doctorModel.experince = workExperienceEditingController.text;
    doctorModel.profession = professionEditingContorller.text;
    // doctorModel.experience = widget.workexperience;
    // doctorModel.address = widget.currentlocation;
    // doctorModel.city = widget.worklocation;
    // doctorModel.currentsalary = salaryEditingController.text;
    // doctorModel.cheffees = int.parse(cheffeesEditingController.text);
    // doctorModel.cuisineexpert = cusineEditingController.text;
    // doctorModel.cuisineexpert = _myCusine;
    // doctorModel.workpreference = timeEditingController.text;
    // doctorModel.dutystatus = true;
    // doctorModel.level = 'Expert';
    // doctorModel.rating = 3.9;
    // doctorModel.role = 'chef';
    doctorModel.profilepic =
        'https://firebasestorage.googleapis.com/v0/b/chef-connect-testing.appspot.com/o/chef-profile%2Ftyt1vei5Zlfdm2miAs90seonQt22?alt=media&token=8fcaf32d-96d0-4afa-a711-d90cf8911c9e';

    await firebaseFirestore
        .collection("doctors")
        .doc(doctorModel.uid)
        .set(doctorModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
          builder: (context) => Doctor_homepage(),
        ),
        (route) => false);
  }
}
