import 'dart:convert';

class PackageModel {
  PackageModel({
    this.name,
    this.description,
    this.publisher,
  });

  final String name;
  final String description;
  final String publisher;

  PackageModel copyWith({
    String title,
    String description,
    String publisher,
  }) =>
      PackageModel(
        name: title ?? this.name,
        description: description ?? this.description,
        publisher: publisher ?? this.publisher,
      );

  factory PackageModel.fromJson(String str) =>
      PackageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PackageModel.fromMap(Map<String, dynamic> json) => PackageModel(
        name: json['name'] == null ? null : json['name'],
        description: json['description'] == null ? null : json['description'],
        publisher: json['publisher'] == null ? null : json['publisher'],
      );

  Map<String, dynamic> toMap() => {
        'name': name == null ? null : name,
        'description': description == null ? null : description,
        'publisher': publisher == null ? null : publisher,
      };

  @override
  String toString() =>
      "PackageModel(name: '$name', description: '$description', publisher: '$publisher')";
}
