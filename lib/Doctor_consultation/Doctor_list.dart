import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthtrackerandcalculator/BottomNavigation.dart';
// import 'package:healthtrackerandcalculator/Dashboard.dart';
import 'package:shimmer/shimmer.dart';

class Doctor_list extends StatefulWidget {
  String? firstname;
  String? lastname;
  String? salary;
  String? profession;
  String? experince;
  String? rating;
  Doctor_list({
    Key? key,
    required this.firstname,
    required this.lastname,
    required this.experince,
    required this.profession,
    required this.rating,
    required this.salary,
  }) : super(key: key);

  @override
  State<Doctor_list> createState() => _Doctor_listState();
}

class _Doctor_listState extends State<Doctor_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: InkWell(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bottompage(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          backgroundColor: Colors.indigo.shade500,
        ),
        body: Container(
          alignment: Alignment(0.2, 0.0),
          width: 350,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(30.0),
              right: Radius.circular(30.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0, 3.0),
                blurRadius: 12.0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                child: Image.asset(
                  'images/maledoctor.png',
                  height: 60,
                ),
                backgroundColor: Colors.grey.shade100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.firstname}+${widget.lastname}",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.profession}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.experince}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey.shade100,
                child: InkWell(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  shimmer() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          alignment: Alignment(0.2, 0.0),
          width: 350,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(30.0),
              right: Radius.circular(30.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0, 3.0),
                blurRadius: 12.0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                child: Image.asset(
                  'images/maledoctor.png',
                  height: 60,
                ),
                backgroundColor: Colors.grey.shade100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // "${widget.firstname}+${widget.lastname}",
                    '',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    // '${widget.profession}',
                    '',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    // '${widget.experince}',
                    '',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey.shade100,
                child: InkWell(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
