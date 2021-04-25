
class AppUserDetailsModel {
  String? name;
  int? id;
  int? otpRetryCount;
  int? appUserStatus;
  bool? isActive;
  bool? forcePasswordChange;
  DateTime? createdDate;
  DateTime? lastModifiedDate;
  String? email;
  String? profilePictureFileId;
  int?  orgId;

  String get routeToDashboard {
      return '/dashboard';
  }

  // @override
  // bool operator ==(o) {
  //   return id == o.id;
  // }

  @override
  int get hashCode {
    return id!;
  }

  AppUserDetailsModel(
      {this.name,
      this.id,
      this.otpRetryCount,
      this.appUserStatus,
      this.isActive,
      this.forcePasswordChange,
      this.profilePictureFileId,
      this.createdDate,
      this.lastModifiedDate,
      this.email,
      this.orgId}) {
    // mobileNo ??= MobileNoModel();
  }

  factory AppUserDetailsModel.fromJson(Map<String, dynamic> json) {
    return AppUserDetailsModel(
        name: json['name'],
        id: json['id'],
        orgId: json['fk_id_org'],
        profilePictureFileId: json['profilePictureFileId'],
        otpRetryCount: json['otpRetryCount'],
        appUserStatus: json['appUserStatus'],
        forcePasswordChange: json['forcePasswordChange'],
        isActive: json['isActive'],
        createdDate: DateTime.parse(json['createdDate']),
        lastModifiedDate: DateTime.parse(json['lastModifiedDate']),
        email: json['email']);
  }

}

