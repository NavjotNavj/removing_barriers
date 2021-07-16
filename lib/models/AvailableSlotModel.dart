class AvailableSlotModel {
  final bool? isBooked;
  final String? doctorid;
  final String? slotid;
  final String? timeslot;

  AvailableSlotModel({
    this.isBooked,
    this.doctorid,
    this.slotid,
    this.timeslot,
  });

  factory AvailableSlotModel.fromJson(Map<String, dynamic> json) {
    return AvailableSlotModel(
      isBooked: json['isBooked'],
      doctorid: json['doctorid'],
      slotid: json['slotid'],
      timeslot: json['timeslot'],
    );
  }

}