// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'out_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Out_student _$Out_studentFromJson(Map<String, dynamic> json) {
  return Out_student()
    ..createdAt = json['createdAt'] as String
    ..objectId = json['objectId'] as String
    ..out_date = json['out_date'] as String
    ..out_student_id = json['out_student_id'] as num
    ..ref_administrator_id = json['ref_administrator_id'] as String
    ..ref_student_id = json['ref_student_id'] as String
    ..updatedAt = json['updatedAt'] as String;
}

Map<String, dynamic> _$Out_studentToJson(Out_student instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'objectId': instance.objectId,
      'out_date': instance.out_date,
      'out_student_id': instance.out_student_id,
      'ref_administrator_id': instance.ref_administrator_id,
      'ref_student_id': instance.ref_student_id,
      'updatedAt': instance.updatedAt
    };
