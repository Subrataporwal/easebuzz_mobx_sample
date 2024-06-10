import 'dart:convert';

class ProductModel {
  final int id;

  final String name;

  final int price;

  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        name: json["name"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
      };
}
