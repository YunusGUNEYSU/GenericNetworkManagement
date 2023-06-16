// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YourModel _$YourModelFromJson(Map<String, dynamic> json) => YourModel(
      id: json['id'] as int?,
      body: json['body'] as String?,
      title: json['title'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$YourModelToJson(YourModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
