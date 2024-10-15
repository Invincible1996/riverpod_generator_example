// "id": 144,

// "title"; "Cricket Helmet",

// "price": 44.99,

// "quantity": 4,

// "total": 179.96,

// "discountPercentage": 11.47,

// "discountedTotal": 159.32,

// "thumbnail": "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket$20Helmet/thumbnail.png"

// },

import 'package:json_annotation/json_annotation.dart';
part 'shopcart_product_model.g.dart';

@JsonSerializable()
class ShopcartProductModel {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  ShopcartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory ShopcartProductModel.fromJson(Map<String, dynamic> json) =>
      _$ShopcartProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopcartProductModelToJson(this);
}
