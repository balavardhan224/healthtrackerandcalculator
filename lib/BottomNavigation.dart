import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/Booking.dart';
import 'package:healthtrackerandcalculator/Dashboard.dart';
import 'package:healthtrackerandcalculator/profile.dart';
import 'package:healthtrackerandcalculator/safety.dart';

class Bottompage extends StatefulWidget {
  Bottompage({Key? key}) : super(key: key);

  @override
  _BottompageState createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  int currentIndex = 0;
  final screens = [
    Dashboard(),
    Booking(),
    Safety(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_note_sharp,
            ),
            label: 'Booking',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Safety',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Profile',
            backgroundColor: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
