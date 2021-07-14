class DoctorListModel {
  // final String? _id;
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? gender;
  final String? address;
  final String? dateofcreation;
  final int? age;
  final String? specialisation;

  DoctorListModel({
    // this._id,
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.gender,
    this.address,
    this.dateofcreation,
    this.age,
    this.specialisation,
  });

  factory DoctorListModel.fromJson(Map<String, dynamic> json) {
    return DoctorListModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      gender: json['gender'],
      address: json['address'],
      dateofcreation: json['dateofcreation'],
      age: json['age'],
      specialisation: json['specialisation'],
    );
  }

}