// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopcart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopcartModel _$ShopcartModelFromJson(Map<String, dynamic> json) =>
    ShopcartModel(
      discountedTotal: (json['discountedTotal'] as num).toDouble(),
      id: (json['id'] as num).toInt(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ShopcartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      totalProducts: (json['totalProducts'] as num).toInt(),
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$ShopcartModelToJson(ShopcartModel instance) =>
    <String, dynamic>{
      'discountedTotal': instance.discountedTotal,
      'id': instance.id,
      'products': instance.products,
      'total': instance.total,
      'totalProducts': instance.totalProducts,
      'totalQuantity': instance.totalQuantity,
      'userId': instance.userId,
    };
