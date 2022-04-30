import 'package:flutter/material.dart';

import '../Helper/dimensions.dart';
import 'login_screen.dart';
// import 'package:glassmorphism/glassmorphism.dart';

// String? finalPhone;

var vpH, vpW;

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => SigninState();
}

class SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    vpH = getViewportHeight(context);
    vpW = getViewportWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              // Image.asset(
              //   "assets/CCI.jpg",
              //   fit: BoxFit.cover,
              //   height: double.infinity,
              //   width: double.infinity,
              //   scale: 1,
              // ),
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Color(0xFF092349),
                      //   radius: 100,
                      //   child: Image.asset(
                      //     'assets/CCI1.png',
                      //     height: 130,
                      //   ),
                      // ),
                      SizedBox(
                        height: 240,
                      ),
                      SizedBox(
                        height: 50,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(
                              //   color: Colors.b,
                              //   width: 3,
                              // ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            onPrimary: Color.fromARGB(255, 18, 68, 138),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  isowner: false,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in as Customer',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 50,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(
                              //   color: Colors.blueGrey,
                              //   width: 3,
                              // ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            onPrimary: Color.fromARGB(255, 18, 68, 138),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  isowner: true,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in as Chef',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
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
