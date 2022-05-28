import 'dart:convert';

class PacientModel {
  String name;
  int age;
  String email;
  String mobilephone;
  String? skinType;
  String? phototype;
  String? moreInformation;
  String? urlPhoto;
  PacientModel({
    required this.name,
    required this.age,
    required this.email,
    required this.mobilephone,
    this.skinType,
    this.phototype,
    this.moreInformation,
    this.urlPhoto,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'mobilephone': mobilephone,
      'skinType': skinType,
      'phototype': phototype,
      'moreInformation': moreInformation,
      'urlPhoto': urlPhoto,
    };
  }

  factory PacientModel.fromMap(Map<String, dynamic> map) {
    return PacientModel(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      email: map['email'] ?? '',
      mobilephone: map['mobilephone'] ?? '',
      skinType: map['skinType'],
      phototype: map['phototype'],
      moreInformation: map['moreInformation'],
      urlPhoto: map['urlPhoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PacientModel.fromJson(String source) =>
      PacientModel.fromMap(json.decode(source));
}
