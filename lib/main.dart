import 'package:echo_health/screens/insurancePage.dart';
import 'package:echo_health/screens/medicalPage.dart';
import 'screens/bloodPressureDetails.dart';
import 'screens/homeScreen.dart';
import 'screens/loginScreen.dart';
import 'package:flutter/material.dart';

import 'screens/signupPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/med-id': (context) => MedicalPage(),
        '/insurance': (context) => InsurancePage(),
        '/blood-pressure': (context) => BloodPressureDetails()
      },
    );
  }
}
