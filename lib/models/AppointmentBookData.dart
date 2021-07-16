class AppointmentBookData {
  final String? userid;
  final String? slotid;
  final String? doctorid;
  final String? additionalrequirement;
  final String? isConfirmedByDoctor;


  AppointmentBookData({
    this.userid,
    this.slotid,
    this.doctorid,
    this.additionalrequirement,
    this.isConfirmedByDoctor,
    });

  factory AppointmentBookData.fromJson(Map<String, dynamic> json) {
    return AppointmentBookData(
      userid: json['userid'],
      slotid: json['slotid'],
      doctorid: json['doctorid'],
      additionalrequirement: json['additionalrequirement'],
      isConfirmedByDoctor: json['isConfirmedByDoctor'],
    );
  }

}