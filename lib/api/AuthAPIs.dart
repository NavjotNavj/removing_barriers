// import 'package:removing_barriers/models/AppUserDetailModel.dart';
// import 'package:removing_barriers/utils/SharedPrefs.dart';
//
// import 'DioClient.dart';
//
// class AuthAPIs{
//   static Future<String> loginWithPassword(
//       String mobileNo, String password) async {
//     var resp =
//     await DioClient.getClient().post("AppUsers/loginWithPassword", data: {
//       "mobileNumber": mobileNo,
//       "password": password,
//       "fcmToken": SharedPrefs.getPref(PrefConstants.FCM_TOKEN)
//     });
//     if (resp.statusCode == 200) {
//       return resp.data['token'] as String;
//     } else {
//       throw resp;
//     }
//   }
//
//   static Future<String> signup(
//       String mobileNo, String password) async {
//     var resp =
//     await DioClient.getClient().post("AppUsers/loginWithPassword", data: {
//       "mobileNumber": mobileNo,
//       "password": password,
//       "fcmToken": SharedPrefs.getPref(PrefConstants.FCM_TOKEN)
//     });
//     if (resp.statusCode == 200) {
//       return resp.data['token'] as String;
//     } else {
//       throw resp;
//     }
//   }
//
//
//   // static Future<AppUserDetailsModel> signup(SignupModel signupModel) async {
//   //   var resp = await DioClient.getClient()
//   //       .post("AppUsers/registerUserMobile", data: signupModel.toJson());
//   //   if (resp.statusCode == 200) {
//   //     return AppUserDetailsModel.fromJson(resp.data);
//   //   } else {
//   //     throw resp.data;
//   //   }
//   // }
//
//
//   static Future<AppUserDetailsModel> getUserDetails() async {
//     var resp = await DioClient.getClient().get("AppUsers/fetchUserDetails");
//     if (resp.statusCode == 200) {
//       AppUserDetailsModel appUser = AppUserDetailsModel.fromJson(resp.data);
//       return appUser;
//     } else {
//       throw resp.data;
//     }
//   }
//
//
// }