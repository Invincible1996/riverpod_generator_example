import 'package:json_annotation/json_annotation.dart';

import 'shopcart_product_model.dart';

part 'shopcart_model.g.dart';

@JsonSerializable()
class ShopcartModel {
  final double discountedTotal;
  final int id;
  final List<ShopcartProductModel> products;
  final double total;
  final int totalProducts;
  final int totalQuantity;
  final int userId;

  ShopcartModel({
    required this.discountedTotal,
    required this.id,
    required this.products,
    required this.total,
    required this.totalProducts,
    required this.totalQuantity,
    required this.userId,
  });

  factory ShopcartModel.fromJson(Map<String, dynamic> json) =>
      _$ShopcartModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopcartModelToJson(this);
}
//