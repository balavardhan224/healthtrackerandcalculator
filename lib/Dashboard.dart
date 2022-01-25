import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthtrackerandcalculator/widget.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.roboto(),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SafeArea(
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
        ),
      ),
      drawer: Drawer(),
    );
  }
}
