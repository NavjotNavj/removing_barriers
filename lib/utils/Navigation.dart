import 'package:flutter/material.dart';
import 'package:removing_barriers/pages/connect/ApointmentAvailableScreen.dart';
import 'package:removing_barriers/pages/connect/ApointmentListForDoctor.dart';
import 'package:removing_barriers/pages/connect/ApointmentsScreen.dart';
import 'package:removing_barriers/pages/connect/HomeScreen.dart';
import 'package:removing_barriers/pages/connect/SelectScreen.dart';

class Navigation{
  static void navigateToHomeScreen(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));

  static void navigateToDoctorList(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => SelectScreen()));

  static void navigateToAvailableAppointments(BuildContext context,String doctorId) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => AppointmentAvailableScreen(doctorId:doctorId)));

  static void navigateToBookedAppointmentList(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => AppointmentsScreen()));

  static void navigateToDoctorAppointmentRequestList(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => AppointmentListDoctor()));

}