// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sepet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SepetModel _$SepetModelFromJson(Map<String, dynamic> json) => SepetModel(
      sepetRowModel: (json['sepetRowModel'] as List<dynamic>?)
          ?.map((e) => SepetRowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$SepetModelToJson(SepetModel instance) =>
    <String, dynamic>{
      'sepetRowModel': instance.sepetRowModel?.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };
