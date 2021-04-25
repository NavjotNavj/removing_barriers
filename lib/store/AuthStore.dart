

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:removing_barriers/api/AuthAPIs.dart';
import 'package:removing_barriers/api/DioClient.dart';
import 'package:removing_barriers/models/AppUserDetailModel.dart';
import 'package:removing_barriers/utils/Globals.dart' as globals;
import 'package:removing_barriers/utils/SharedPrefs.dart';

part 'AuthStore.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool? showProgress;

  @observable
  AppUserDetailsModel? appUser;

  bool get isAuthenticated {
    return appUser != null;
  }

  @action
  Future<void> initStore() async {
    try {
      // await OptionAPIs.getAllOptions();
      if (SharedPrefs.getPref(PrefConstants.IS_LOGGED_IN,
          defaultValue: false)) {
        String jwttoken = await SharedPrefs.getValue(PrefConstants.JWT_TOKEN);
        globals.token = jwttoken;
        appUser = await AuthAPIs.getUserDetails();
      }
    } catch (ex) {
      print(ex);
    }
  }

  // @action
  // Future<void> getUserDetail() async {
  //   try {
  //     showProgress = true;
  //     appUser = await AuthAPIs.getUserDetails();
  //   } catch (ex) {
  //     print(ex);
  //   } finally {
  //     showProgress = false;
  //   }
  // }

  @action
  Future<String> loginWithPassword(
      BuildContext context, String mobileNo, String password,
      {bool isRedirectToAdmin = false}) async {
    String token = "";
    try {
      showProgress = true;
      globals.token = null;
      token = await AuthAPIs.loginWithPassword(mobileNo, password);
      if (isRedirectToAdmin) {
        await redirectToAdmin(context, token);
      }
    } catch (ex) {
      showErrorDialog(context, ex);
    } finally {
      showProgress = false;
    }
    return token;
  }

  // @action
  // Future<String> loginWithOTP(BuildContext context, String mobileNo, String otp,
  //     {bool isRedirectToAdmin = false}) async {
  //   String token;
  //   try {
  //     showProgress = true;
  //     token = await AuthAPIs.loginWithOTP(mobileNo, otp);
  //     if (isRedirectToAdmin) {
  //       await redirectToAdmin(context, token);
  //     }
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return token;
  // }

  // @action
  // Future<bool> generateOTP(BuildContext context, String mobileNo) async {
  //   bool success;
  //   try {
  //     showProgress = true;
  //     success = await AuthAPIs.generateOTP(mobileNo);
  //   } catch (ex) {
  //     showErrorDialog(context, ex, onOKPressed: () {
  //       Navigator.of(context).pop();
  //     });
  //   } finally {
  //     showProgress = false;
  //   }
  //   return success;
  // }

  // @action
  // Future<String> verifyOTP(
  //     BuildContext context, String mobileNo, String otp) async {
  //   String token;
  //   try {
  //     showProgress = true;
  //     token = await AuthAPIs.verifyOTP(mobileNo, otp);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return token;
  // }

  // @action
  // Future<String> forgotPassword(BuildContext context, String mobileNo,
  //     String newPassword, String otp) async {
  //   String token;
  //   try {
  //     showProgress = true;
  //     token = await AuthAPIs.forgotPassword(
  //       mobileNo,
  //       newPassword,
  //       otp,
  //     );
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return token;
  // }

  // @action
  // Future<AppUserDetailsModel> signup(
  //     BuildContext context, SignupModel signupModel) async {
  //   AppUserDetailsModel signupResp;
  //   try {
  //     showProgress = true;
  //     signupResp = await AuthAPIs.signup(signupModel);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return signupResp;
  // }

  // @action
  // Future<AppUserDetailsModel> getAppUserByMobileNumber(
  //     BuildContext context, MobileNoModel mobileNoModel) async {
  //   AppUserDetailsModel appUserDetailsModel;
  //   try {
  //     showProgress = true;
  //     appUserDetailsModel =
  //         await AuthAPIs.getAppUserByMobileNumber(mobileNoModel);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return appUserDetailsModel;
  // }

  // @action
  // Future<List<AppUserRoleLocationMappingModel>> getUserRoleLocationMapping(
  //     BuildContext context, int userId) async {
  //   List<AppUserRoleLocationMappingModel> resp;
  //   try {
  //     showProgress = true;
  //     resp = await AuthAPIs.getUserRoleLocationMapping(userId);
  //     resp.removeWhere((element) => element.locationId == null);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return resp;
  // }

  // @action
  // Future<AppUserRoleLocationMappingModel> addUserRoleLocationMapping(
  //     BuildContext context, AppUserRoleLocationMappingModel data) async {
  //   AppUserRoleLocationMappingModel appUserRoleLocationMappingModel;
  //   try {
  //     showProgress = true;
  //     appUserRoleLocationMappingModel =
  //         await AuthAPIs.addUserRoleLocationMapping(data);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return appUserRoleLocationMappingModel;
  // }

  // @action
  // Future<AppUserDetailsModel> createAppUser(
  //     BuildContext context,
  //     MobileNoModel mobileNumber,
  //     String name,
  //     String emailId,
  //     UserRole role) async {
  //   AppUserDetailsModel appUserDetailsModel;
  //   try {
  //     showProgress = true;
  //     appUserDetailsModel =
  //         await AuthAPIs.createAppUser(mobileNumber, name, emailId, role);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return appUserDetailsModel;
  // }

  // @action
  // Future<AppUserRoleLocationMappingModel> modifyUserRoleLocationMapping(
  //     BuildContext context, AppUserRoleLocationMappingModel data) async {
  //   AppUserRoleLocationMappingModel appUserRoleLocationMappingModel;
  //   try {
  //     showProgress = true;
  //     appUserRoleLocationMappingModel =
  //         await AuthAPIs.modifyUserRoleLocationMapping(data);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return appUserRoleLocationMappingModel;
  // }

  // @action
  // Future<bool> deleteUserRoleLocationMapping(
  //     BuildContext context, int id) async {
  //   bool result;
  //   try {
  //     showProgress = true;
  //     result = await AuthAPIs.deleteUserRoleLocationMapping(id);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return result;
  // }

  // @action
  // Future<List<OrgModel>> getOrgListByUserId(BuildContext context) async {
  //   List<OrgModel> orgList;
  //   try {
  //     showProgress = true;
  //     AppUserDetailsModel user = await AuthAPIs.getUserDetails();
  //     orgList = await AuthAPIs.getOrgListByUserId(user.id);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return orgList;
  // }

  // @action
  // Future<bool> changePassword(
  //     BuildContext context, String oldPassword, String newPassword) async {
  //   bool result;
  //   try {
  //     showProgress = true;
  //     result =
  //         await AuthAPIs.changePassword(appUser.id, oldPassword, newPassword);
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return result;
  // }

  // @action
  // Future<bool> uploadProfilePicture(BuildContext context, File file) async {
  //   bool result;
  //   try {
  //     showProgress = true;
  //     result = await AuthAPIs.uploadProfilePicture(appUser.id, file);
  //     appUser = await AuthAPIs.getUserDetails();
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return result;
  // }

  // @action
  // Future<List<AppUserDetailsModel>> getAppUsersListByOrgId(
  //     BuildContext context) async {
  //   List<AppUserDetailsModel> appUsers;
  //   try {
  //     showProgress = true;
  //     List<AppUserRoleLocationMappingModel> data =
  //         await AuthAPIs.getUserRoleLocationMappingByOgrId();
  //     appUsers = List<AppUserDetailsModel>();
  //     appUsers = data
  //         .map<AppUserDetailsModel>((e) => e.appUser)
  //         .toList()
  //         .toSet()
  //         .toList();
  //   } catch (ex) {
  //     showErrorDialog(context, ex);
  //   } finally {
  //     showProgress = false;
  //   }
  //   return appUsers;
  // }

  @action
  Future<void> redirectToAdmin(BuildContext context, String token) async {
    try {
      globals.token = token;
      await SharedPrefs.setValue(PrefConstants.JWT_TOKEN, token);
      SharedPrefs.setPref(PrefConstants.IS_LOGGED_IN, true);
      appUser = await AuthAPIs.getUserDetails();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(appUser!.routeToDashboard, (_) => false);
    } catch (ex) {
      showErrorDialog(context, ex);
    }
  }

//todo changes
// @action
// Future<bool> updateTokenNew(
//     BuildContext context, int locationId, int roleId) async {
//   bool success;
//   try {
//     showProgress = true;
//     success = await AuthAPIs.updateTokenNew(locationId, roleId);
//   } catch (ex) {
//     showErrorDialog(context, ex);
//   } finally {
//     showProgress = false;
//   }
//   return success;
// }
}
