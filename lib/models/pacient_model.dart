import 'dart:convert';

import 'package:wood_analyzer/models/diagnostic_dto.dart';

class PacientModel {
  String name;
  int age;
  String email;
  String mobilephone;
  String? professional;
  String? skinType;
  String? phototype;
  String? moreInformation;
  String? urlPhoto;
  List<DiagnosticDto>? diagnostics;

  PacientModel({
    required this.name,
    required this.age,
    required this.email,
    required this.mobilephone,
    this.professional,
    this.skinType,
    this.phototype,
    this.moreInformation,
    this.urlPhoto,
    this.diagnostics,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'mobilephone': mobilephone,
      'professional': professional,
      'skinType': skinType,
      'phototype': phototype,
      'moreInformation': moreInformation,
      'urlPhoto': urlPhoto,
      'diagnostics': diagnostics?.map((x) => x.toMap()).toList(),
    };
  }

  factory PacientModel.fromMap(Map<String, dynamic> map) {
    return PacientModel(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      email: map['email'] ?? '',
      mobilephone: map['mobilephone'] ?? '',
      professional: map['professional'],
      skinType: map['skinType'],
      phototype: map['phototype'],
      moreInformation: map['moreInformation'],
      urlPhoto: map['urlPhoto'],
      diagnostics: map['diagnostics'] != null
          ? List<DiagnosticDto>.from(
              map['diagnostics']?.map(
                (x) => DiagnosticDto.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PacientModel.fromJson(String source) => PacientModel.fromMap(
        json.decode(source),
      );
}
