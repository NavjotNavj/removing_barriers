class DoctorData {
  final String? token;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;
  final String? address;
  final String? dateofcreation;
  final int? age;
  final String? specialisation;


  DoctorData({
    this.token,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.address,
    this.dateofcreation,
    this.specialisation,
    this.age,});

  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      address: json['address'],
      dateofcreation: json['dateofcreation'],
      specialisation: json['specialisation'],
      age: json['age'],
    );
  }

}