import 'dart:convert';

class DataModel {
  final String title;
  final String description;
  final int index;

  DataModel({
    required this.title,
    required this.description,
    required this.index,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'index': index,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source));
}
