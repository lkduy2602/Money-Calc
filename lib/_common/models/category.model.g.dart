// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel()
      ..createdAt = json['created_at'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..normalizedText = json['normalized_text'] as String?;

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'name': instance.name,
      'normalized_text': instance.normalizedText,
    };
