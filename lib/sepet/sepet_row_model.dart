import 'package:json_annotation/json_annotation.dart';

import '../product/product_model.dart';
part 'sepet_row_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SepetRowModel {
  late int quentity;
  final ProductModel product;

  SepetRowModel({required this.product, this.quentity = 1});

  factory SepetRowModel.fromJson(Map<String, dynamic> json) => _$SepetRowModelFromJson(json);

  Map<String, dynamic> toJson() => _$SepetRowModelToJson(this);
}
