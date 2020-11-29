import 'package:flutter/material.dart';
import 'package:echo_health/constants/custom_clipper.dart';
import 'package:echo_health/constants/style.dart';

class MedicalPage extends StatefulWidget {
  static String route = '/med-id';
  @override
  _MedicalPageState createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(children: <Widget>[
        ClipPath(
          clipper: MyCustomClipper(clipType: ClipType.bottom),
          child: Container(
            color: Theme.of(context).accentColor,
            height: (Constants.headerHeight + statusBarHeight) - 80,
          ),
        ),
        Positioned(
          right: -45,
          top: -30,
          child: ClipOval(
            child: Container(
              color: Colors.black.withOpacity(0.05),
              height: 160,
              width: 160,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Constants.paddingSide),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  CircleAvatar(
                    radius: 26.0,
                    backgroundImage: AssetImage('assets/fakethomas.png'),
                  )
                ],
              ),
              SizedBox(height: 60),
              Column(
                children: <Widget>[
                  Text("Mrs. Carmody"),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
