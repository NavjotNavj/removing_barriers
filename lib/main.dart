import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:removing_barriers/pages/WelcomePage.dart';
import 'package:removing_barriers/pages/common/LoginPage.dart';
import 'package:removing_barriers/pages/connect/HomeScreen.dart';
import 'package:removing_barriers/pages/connect/SelectScreen.dart';
import 'package:removing_barriers/prediction/TestScren.dart';

import 'medicinesManager/screens/add_new_medicine/add_new_medicine.dart';
import 'medicinesManager/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute:"/" ,
      routes: {
        '/':(context)=>LoginPage(title: "Login Page"),
        '/homescreen':(context)=>HomeScreen(),
        '/selectscreen':(context)=>SelectScreen(),
        '/home/medicinesHelper/home':(context)=>MedicinesHelperHome(),
        '/home/medicinesHelper/add_new_medicine':(context)=>AddNewMedicine(),
        '/home/testScreen':(context)=>TestScreen(),

      }
    );
  }
}
