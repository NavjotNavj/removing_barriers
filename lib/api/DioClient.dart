// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:removing_barriers/constants/APIConstants.dart';
// import 'package:removing_barriers/utils/Globals.dart' as globals;
// import 'package:removing_barriers/models/APIErrorModel.dart';
// import 'package:removing_barriers/utils/SharedPrefs.dart';
//
// class DioClient {
//   static Dio? _dioClient;
//
//   static Dio getClient() {
//     if (_dioClient == null) {
//       _dioClient = new Dio(
//         BaseOptions(
//             baseUrl: APIConstants.BASE_URL,
//             connectTimeout: APIConstants.TIMEOUT,
//             receiveTimeout: APIConstants.TIMEOUT,
//             validateStatus: (status) {
//               return status! < 400;
//             },
//             headers: {
//               "source": APIConstants.API_SOURCE,
//               "version": APIConstants.API_VERSION,
//               "Accept": "application/json",
//             }),
//       );
//       _dioClient!.interceptors.add(PrettyDioLogger(
//           requestHeader: true,
//           requestBody: true,
//           responseBody: true,
//           responseHeader: true,
//           error: true,
//           compact: true,
//           maxWidth: 90));
//       _dioClient!.interceptors.add(InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           if (globals.token != null || globals.token!.isEmpty) {
//             options.headers.putIfAbsent('Authorization', () => globals.token);
//           }
//           return handler.next(options);
//         },
//         onResponse: (response, handler) {
//           // if (response.headers.value('token') != null) {
//           //   globals.token = response.headers.value('token');
//           // }
//           return handler.next(response); // continue
//         },
//         onError: (error, handler) {
//           if (error.response?.statusCode == 401 &&
//               error.response?.statusMessage == "Unauthorized" &&
//               // error.response!.data
//               //     .toString()
//               //     .toLowerCase()
//               //     ?contains("login again")
//               // &&
//               SharedPrefs.getPref(PrefConstants.IS_LOGGED_IN,
//                   defaultValue: false)) {
//             // RequestOptions options = error.response.request;
//
//             _dioClient!.interceptors.requestLock.lock();
//             _dioClient!.interceptors.responseLock.lock();
//             globals.token = null;
//             SharedPrefs.setPref(PrefConstants.IS_LOGGED_IN, false);
//             globals.navKey?.currentState
//                 ?.pushNamedAndRemoveUntil('/', (route) => false);
//             _dioClient!.interceptors.requestLock.unlock();
//             _dioClient!.interceptors.responseLock.unlock();
//           }
//           return handler.next(error);
//         },
//       ));
//     }
//     return _dioClient!;
//   }
// }
//
// void showErrorDialog(BuildContext context, dynamic errorResponse,
//     {Function? onOKPressed}) {
//   String errorTitle = "", errorMsg = "", buttonText = "OK";
//   bool dismissable = true;
//
//   if (errorResponse is DioError) {
//     if (errorResponse.error is SocketException) {
//       errorTitle = "Network Error";
//       errorMsg =
//           "There is some issue with your internet connection. Please check your internet connection settings and try again.";
//     } else if (errorResponse.response != null) {
//       if (errorResponse.response!.data is Map &&
//           errorResponse.response!.data.containsKey("error")) {
//         var errorDetails =
//             APIErrorModel.fromJson(errorResponse.response!.data['error']);
//         errorTitle = errorResponse.response!.statusMessage!;
//         errorMsg = errorDetails.message!;
//       } else {
//         errorTitle = errorResponse.response!.statusMessage!;
//         errorMsg = errorResponse.response!.data.toString();
//       }
//     } else {
//       errorTitle = "API Error";
//       if (errorResponse.message.isEmpty)
//         errorMsg = errorResponse.message.toString();
//       else
//         errorMsg = "There was some problem while connecting to the server.";
//     }
//   } else {
//     errorTitle = "Error";
//     errorMsg = errorResponse.toString();
//   }
//   showDialog(
//       context: context,
//       barrierDismissible: dismissable,
//       builder: (BuildContext context) {
//         return WillPopScope(
//           onWillPop: () {
//             return Future.value(dismissable);
//           },
//           child: AlertDialog(
//             title: Text(errorTitle),
//             content: Text(errorMsg),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: (() {
//                   Navigator.of(context).pop();
//                   if (onOKPressed != null) {
//                     onOKPressed();
//                   }
//                 }),
//                 child: Text(buttonText),
//               )
//             ],
//           ),
//         );
//       });
// }
