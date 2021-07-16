import 'Data.dart';

class AppointmentBookModel {
  final int? status;
  final bool? error;
  final String? message;
  final Data? data;

  AppointmentBookModel({
    this.status,
    this.error,
    this.message,
    this.data,});

  factory AppointmentBookModel.fromJson(Map<String, dynamic> json) {
    return AppointmentBookModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: Data.fromJson(json['data']),
      // token: json['token'],
    );
  }

}