import 'dart:developer';

import '../Helper/dimensions.dart';
import 'otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:park_place/screens/otpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool role = false;
var vpH, vpW;

class LoginScreen extends StatefulWidget {
  static String? phone;
  final bool isowner;

  LoginScreen({Key? key, required this.isowner}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final snackBar = SnackBar(
    content: Text(
      'Please enter valid phone number',
      style: TextStyle(
        fontFamily: 'Montserrat',
      ),
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  );

  @override
  void initState() {
    fetchRole();
    super.initState();
  }

  void fetchRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (widget.isowner) {
      await pref.setBool('chefRole', true);
    } else {
      await pref.setBool('chefRole', false);
    }
  }

  void _signIn() async {
    _formkey.currentState!.validate();
    if (LoginScreen.phone!.isNotEmpty && LoginScreen.phone!.length == 10) {
      // Navigator.pushReplacementNamed(context, "/otpScreen");
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => OTPScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    vpH = getViewportHeight(context);
    vpW = getViewportWidth(context);
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.grey.withOpacity(.2),
          body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          // Image.asset(
          //   "assets/CCI.jpg",
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          //   width: double.infinity,
          //   scale: 1,
          // ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 30,
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.isowner
                                  ? "Find your dream jobs with\n chef connect india"
                                  : "Hire a Chef",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 24,
                                backgroundColor: Colors.black54,
                              ),
                              // style: GoogleFonts.dancingScript(
                              //   color: Colors.white,
                              //   textStyle:
                              //       Theme.of(context).textTheme.headline4,
                              //   fontSize: 28,
                              //   fontWeight: FontWeight.w900,
                              //   fontStyle: FontStyle.italic,
                              // ),
                              // style: TextStyle(
                              //     fontFamily: 'SquarePeg',
                              //     color: Colors.white,
                              //     fontSize: 45,
                              //     fontWeight: FontWeight.bold,
                              //     backgroundColor:
                              //         Colors.black.withOpacity(.4)),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Column(
                          children: [
                            // CircleAvatar(
                            //   backgroundColor: Color(0xFF092349),
                            //   radius: 100,
                            //   child: Image.asset('assets/CCI1.png'),
                            // ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.isowner
                                  ? ""
                                  : "One Stop Solution for all Your Culinary Needs",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: Colors.white,
                                backgroundColor: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                              // textAlign: TextAlign.center,
                              // style: GoogleFonts.caveat(
                              //     color: Colors.white,
                              //     textStyle:
                              //         Theme.of(context).textTheme.headline4,
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.w900,
                              //     fontStyle: FontStyle.italic,
                              //     backgroundColor:
                              //         Colors.black.withOpacity(.7)),
                              // style: TextStyle(
                              //     fontFamily: 'Montserrat',
                              //     color: Colors.white,
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.bold,
                              //     backgroundColor:
                              //         Colors.black.withOpacity(.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _formModule(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }

  Widget _formModule() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Form(
        key: _formkey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.black.withOpacity(.4),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Enter Phone Number",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white12),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(.05),
                          ),
                          padding: EdgeInsets.fromLTRB(20, 5, 15, 5),
                          child: TextFormField(
                            maxLength: 10,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              prefixText: "+91 ",
                              border: InputBorder.none,
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white60.withOpacity(.5),
                              ),
                            ),
                            obscureText: false,
                            validator: (val) {
                              log(val!);
                              setState(() {
                                LoginScreen.phone = val;
                              });
                              return null;
                            },
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        //Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //shadowColor: Colors.white38,
                  primary: Colors.white,
                  elevation: 10,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _signIn();
                },
                child: Container(
                  width: 120,
                  child: Center(
                    child: Text(
                      "Send OTP",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
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
}
