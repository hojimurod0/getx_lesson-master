import 'dart:convert';

class ProductModel {
  final String? status;
  final String? message;
  final List<Product>? products;

  ProductModel({
    this.status,
    this.message,
    this.products,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  final int? id;
  final String? title;
  final String? image;
  final int? price;
  final String? description;
  final String? brand;
  final String? model;
  final String? color;
  final String? category;
  final int? discount;
  final bool? popular;
  final bool? onSale;

  Product({
    this.id,
    this.title,
    this.image,
    this.price,
    this.description,
    this.brand,
    this.model,
    this.color,
    this.category,
    this.discount,
    this.popular,
    this.onSale,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        brand: json["brand"],
        model: json["model"],
        color: json["color"],
        category: json["category"],
        discount: json["discount"],
        popular: json["popular"],
        onSale: json["onSale"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "description": description,
        "brand": brand,
        "model": model,
        "color": color,
        "category": category,
        "discount": discount,
        "popular": popular,
        "onSale": onSale,
      };
}
