// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sepet_row_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SepetRowModel _$SepetRowModelFromJson(Map<String, dynamic> json) =>
    SepetRowModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quentity: json['quentity'] as int? ?? 1,
    );

Map<String, dynamic> _$SepetRowModelToJson(SepetRowModel instance) =>
    <String, dynamic>{
      'quentity': instance.quentity,
      'product': instance.product.toJson(),
    };
