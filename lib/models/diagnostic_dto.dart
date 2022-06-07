import 'dart:convert';

class DiagnosticDto {
  final String name;
  final String color;
  final DateTime date;

  DiagnosticDto({
    required this.name,
    required this.color,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'color': color,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory DiagnosticDto.fromMap(Map<String, dynamic> map) {
    return DiagnosticDto(
      name: map['name'] ?? '',
      color: map['color'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiagnosticDto.fromJson(String source) =>
      DiagnosticDto.fromMap(json.decode(source));
}
