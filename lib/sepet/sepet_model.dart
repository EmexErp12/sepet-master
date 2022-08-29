import 'package:json_annotation/json_annotation.dart';

import 'package:sepet/sepet/sepet_row_model.dart';

part 'sepet_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SepetModel {
  late List<SepetRowModel>? sepetRowModel;
  late double total;

  SepetModel({this.sepetRowModel, this.total = 0.0}) {
    sepetRowModel ??= <SepetRowModel>[];
  }

  factory SepetModel.fromJson(Map<String, dynamic> json) => _$SepetModelFromJson(json);

  Map<String, dynamic> toJson() => _$SepetModelToJson(this);
}

//flutter pub run build_runner buildSepetModel