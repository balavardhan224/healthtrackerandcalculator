// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
// import 'package:chef_connect_india/roles/user/Registration_user.dart';
import 'package:healthtrackerandcalculator/user/Registration_user.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:pin_code_fields/pin_code_fields.dart';
enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORMS_STATE }

class USer_login extends StatefulWidget {
  USer_login({Key? key}) : super(key: key);

  @override
  State<USer_login> createState() => _USer_loginState();
}

class _USer_loginState extends State<USer_login> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  String phoneNumber = "+91";

  void _onCountryChange(CountryCode countryCode) {
    this.phoneNumber = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  void check() {
    print("Full Text: " + this.phoneNumber + _phoneController.text);
  }

  String verificationId = "";
  bool isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  void alert() {
    if (_phoneController.text == "") {
      Alert(
              context: context,
              title: "PhoneNumber Required",
              desc: "Please enter Phone No.")
          .show();
    } else {
      setState(() {
        isLoading = true;
      });
    }
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    String a = this.phoneNumber + _phoneController.text;
    print(this.phoneNumber + _phoneController.text);
    setState(() {
      isLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        isLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Registration_user()));
      }
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${e.message}"),
        ),
      );
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        // TextFormField(
        //   controller: _phoneController,
        //   decoration: InputDecoration(
        //     hintText: "Enter Phone Number",
        //   ),
        // ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            CountryCodePicker(
              onChanged: _onCountryChange,
              initialSelection: 'IN',
              favorite: ['+91', 'IN'],
              // optional. Shows only country name and flag
              showCountryOnly: true,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              // alignLeft: false,
              enabled: true,
            ),
            Container(
              width: 150,
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "Enter Phone Number"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Center(
          child: TextButton(
            // color: Colors.blueAccent,
            onPressed: () async {
              check();
              // alert();
              await _auth.verifyPhoneNumber(
                  phoneNumber: this.phoneNumber + _phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      isLoading = false;
                    });
                    // signInWithPhoneAuthCredential();
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      isLoading = false;
                    });
                    _scaffoldKey.currentState?.showBottomSheet(
                        (context) => Text("${verificationFailed.message}"));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      setState(() {
                        isLoading = false;
                      });
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORMS_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {});
            },
            child: Text("Send OTP", style: TextStyle(color: Colors.white)),
          ),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextFormField(
          controller: _otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextButton(
            // color: Colors.blueAccent,
            onPressed: () {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: _otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text(
              "Verify",
              style: TextStyle(color: Colors.white),
            )),
        Spacer()
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
                      height: 620,
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
                      child: Column(
                        children: [
                          // getMobileFormWidget(context),
                          //  getOtpFormWidget(context),

                          SizedBox(
                            height: 40,
                          ),

                          CircleAvatar(
                            backgroundColor: Colors.white54,
                            radius: 80,
                            child: LottieBuilder.asset(
                              'images/health.json',
                              height: 130,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white70,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                filled: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 15),
                                  child: Text(
                                    " (+91) ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    check();
                                    // alert();
                                    await _auth.verifyPhoneNumber(
                                        phoneNumber: this.phoneNumber +
                                            _phoneController.text,
                                        verificationCompleted:
                                            (phoneAuthCredential) async {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          // signInWithPhoneAuthCredential();
                                        },
                                        verificationFailed:
                                            (verificationFailed) async {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          _scaffoldKey.currentState
                                              ?.showBottomSheet((context) => Text(
                                                  "${verificationFailed.message}"));
                                        },
                                        codeSent: (verificationId,
                                            resendingToken) async {
                                          setState(() {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            currentState =
                                                MobileVerificationState
                                                    .SHOW_OTP_FORMS_STATE;
                                            this.verificationId =
                                                verificationId;
                                          });
                                        },
                                        codeAutoRetrievalTimeout:
                                            (verificationId) async {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 15),
                                    child: Text(
                                      'Send OTP',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 18, 68, 138),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.white,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                ),
                                Text(
                                  "Enter 6 digit OTP",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.white,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: "Enter OTP",
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
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
                          ),
                          SizedBox(
                            height: 20,
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
                                  )),
                              onPressed: () async {
                                PhoneAuthCredential phoneAuthCredential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationId,
                                        smsCode: _otpController.text);
                                signInWithPhoneAuthCredential(
                                    phoneAuthCredential);
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    'mobile1', phoneNumber);
                              },
                              child: Text(
                                'Validate OTP',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 18, 68, 138)),
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
          ],
        ),
      ),
    );
  }
}
