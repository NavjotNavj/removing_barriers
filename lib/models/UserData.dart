class UserData {
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;
  final String? address;
  final String? dateofcreation;
  final int? age;

  UserData({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.address,
    this.dateofcreation,
    this.age,});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      address: json['address'],
      dateofcreation: json['dateofcreation'],
      age: json['age'],
    );
  }

}