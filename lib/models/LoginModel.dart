import 'Data.dart';

class LoginModel {
  final int? status;
  final bool? error;
  final String? message;
  final Data? data;

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
      data: Data.fromJson(json['data']),
      // token: json['token'],
    );
  }

}