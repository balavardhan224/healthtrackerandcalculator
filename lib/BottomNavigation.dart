import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white70,
        selectedIndex: currentIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.home,
            ),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
            title: Text('Home'),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.event_note_sharp,
            ),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
            title: Text('Booking'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.health_and_safety),
            title: Text('Safety'),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            title: Text('Profile'),
            activeColor: Colors.indigo,
            inactiveColor: Colors.grey,
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
