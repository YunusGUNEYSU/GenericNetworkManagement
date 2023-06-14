// To parse this JSON data, do
//
//     final yourModel = yourModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:network_management/core/model/base_model.dart';

part 'test_model.g.dart';

@JsonSerializable()
class YourModel extends IBaseModel {
   String? name;

  YourModel({
    this.name,
  });

  factory YourModel.fromJson(Map<String, dynamic> json) => _$YourModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$YourModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    YourModel.fromJson(json);
  }
}
