import 'package:removing_barriers/models/AvailableSlotModel.dart';
import 'package:removing_barriers/models/DoctorListModel.dart';
import 'package:removing_barriers/models/UserData.dart';

import 'Data.dart';

class MyUserAppointmentModel {
  final bool? isConfirmedByDoctor;
  final String? id;
  // final UserData? userid;
  final AvailableSlotModel? slotid;
  final DoctorListModel? doctorid;
  final String? additionalrequirement;

  MyUserAppointmentModel({
    this.isConfirmedByDoctor,
    this.id,
    // this.userid,
    this.slotid,
    this.doctorid,
    this.additionalrequirement,
  });

  factory MyUserAppointmentModel.fromJson(Map<String, dynamic> json) {
    return MyUserAppointmentModel(
      isConfirmedByDoctor: json['isConfirmedByDoctor'],
      id: json['_id'],
      // userid: json['userid'],
      slotid: json['slotid'],
      doctorid: json['doctorid'],
      additionalrequirement: json['additionalrequirement'],
    );
  }

}