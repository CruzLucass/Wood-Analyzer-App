import 'dart:convert';

class DiagnosticDto {
  final String name;
  final String color;

  DiagnosticDto({
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'color': color,
    };
  }

  factory DiagnosticDto.fromMap(Map<String, dynamic> map) {
    return DiagnosticDto(
      name: map['name'] ?? '',
      color: map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DiagnosticDto.fromJson(String source) =>
      DiagnosticDto.fromMap(json.decode(source));
}
