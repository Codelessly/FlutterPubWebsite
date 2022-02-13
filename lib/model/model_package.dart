import 'dart:convert';

class PackageModel {
  PackageModel({
    required this.name,
    required this.description,
    required this.publisher,
  });

  final String name;
  final String description;
  final String publisher;

  PackageModel copyWith({
    String? title,
    String? description,
    String? publisher,
  }) =>
      PackageModel(
        name: title ?? name,
        description: description ?? this.description,
        publisher: publisher ?? this.publisher,
      );

  factory PackageModel.fromJson(String str) =>
      PackageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PackageModel.fromMap(Map<String, dynamic> json) => PackageModel(
        name: json['name'],
        description: json['description'],
        publisher: json['publisher'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'publisher': publisher,
      };

  @override
  String toString() =>
      "PackageModel(name: '$name', description: '$description', publisher: '$publisher')";
}
