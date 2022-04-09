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
        backgroundColor: Colors.indigo.shade500,
        title: Text(
          'Dashboard',
          style: GoogleFonts.roboto(),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
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
