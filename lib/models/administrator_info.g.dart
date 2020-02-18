// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'administrator_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Administrator_info _$Administrator_infoFromJson(Map<String, dynamic> json) {
  return Administrator_info()
    ..administrator_branch = json['administrator_branch'] as String
    ..administrator_id = json['administrator_id'] as String
    ..administrator_level = json['administrator_level'] as String
    ..administrator_name = json['administrator_name'] as String
    ..createdAt = json['createdAt'] as String
    ..objectId = json['objectId'] as String
    ..updatedAt = json['updatedAt'] as String;
}

Map<String, dynamic> _$Administrator_infoToJson(Administrator_info instance) =>
    <String, dynamic>{
      'administrator_branch': instance.administrator_branch,
      'administrator_id': instance.administrator_id,
      'administrator_level': instance.administrator_level,
      'administrator_name': instance.administrator_name,
      'createdAt': instance.createdAt,
      'objectId': instance.objectId,
      'updatedAt': instance.updatedAt
    };
