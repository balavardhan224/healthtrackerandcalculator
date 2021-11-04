import 'dart:js';

import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/widget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: buildcontainer(context),
      ),
      drawer: Drawer(),
    );
  }
}
