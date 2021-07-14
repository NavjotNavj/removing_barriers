import 'Data.dart';
import 'DoctorData.dart';

class LoginModel {
  final int? status;
  final bool? error;
  final String? message;
  final DoctorData? data;

  LoginModel({
    this.status,
    this.error,
    this.message,
    this.data,});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: DoctorData.fromJson(json['data']),
      // token: json['token'],
    );
  }

}