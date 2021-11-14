import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          'Dashboard',
          style: GoogleFonts.roboto(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            buildcontainer(context),
            SizedBox(
              height: 40,
            ),
            buildbox(context),
            SizedBox(
              height: 40,
            ),
            buildbox1(context),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
