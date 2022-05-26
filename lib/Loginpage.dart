// import 'package:flare_flutter/flare_actor.dart';
// import 'package:flutter/material.dart';
// //import 'package:healthtrackerandcalculator/homepage.dart';
// import 'package:healthtrackerandcalculator/splashscreen.dart';

// class Loginpage extends StatefulWidget {
//   @override
//   _LoginpageState createState() => _LoginpageState();
// }

// class _LoginpageState extends State<Loginpage> {
//   String animationtype = 'idle';

//   String correctpassword = 'admin';

//   final passwordcontroller = TextEditingController();
//   final usercontroller = TextEditingController();
//   final passwordfocusnode = FocusNode();
//   final usernamefocusnode = FocusNode();

//   @override
//   void initState() {
//     passwordfocusnode.addListener(() {
//       if (passwordfocusnode.hasFocus) {
//         setState(() {
//           animationtype = 'hands_up';
//         });
//       } else {
//         setState(() {
//           animationtype = 'hands_down';
//         });
//       }
//     });

//     usernamefocusnode.addListener(() {
//       if (passwordfocusnode.hasFocus) {
//         setState(() {
//           animationtype = 'Check';
//         });
//         setState(() {
//           animationtype = 'idle';
//         });
//       }
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFD6E2EA),
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 10,
//         ),
//         child: ListView(
//           children: [
//             Row(
//               children: [
//                 // IconButton(
//                 //   onPressed: () {
//                 //     Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //         builder: (context) => Loginwith(),
//                 //       ),
//                 //     );
//                 //   },
//                 //   icon: Icon(
//                 //     Icons.arrow_back_ios,
//                 //   ),
//                 // )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Welcome',
//                 style: TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Roboto',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: Container(
//                 height: 200,
//                 width: 400,
//                 child: new FlareActor(
//                   'images/Teddy.flr',
//                   fit: BoxFit.contain,
//                   animation: animationtype,
//                   callback: (animation) {
//                     setState(() {
//                       animationtype = 'idle';
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Stack(
//               children: [
//                 Container(
//                   height: 290,
//                   width: 400,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: TextFormField(
//                           controller: usercontroller,
//                           focusNode: usernamefocusnode,
//                           decoration: InputDecoration(
//                             hintText: 'Enter email',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(
//                                 15,
//                               ),
//                             ),
//                             labelText: 'Email',
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       SizedBox(
//                         width: 340,
//                         child: TextFormField(
//                           controller: passwordcontroller,
//                           focusNode: passwordfocusnode,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             hintText: 'Enter Password',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(
//                                 15,
//                               ),
//                             ),
//                             labelText: 'Password',
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       SizedBox(
//                         height: 50,
//                         width: 150,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 15,
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Splashscreen(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             'Login',
//                             style:
//                                 TextStyle(fontSize: 20, fontFamily: 'Roboto'),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
