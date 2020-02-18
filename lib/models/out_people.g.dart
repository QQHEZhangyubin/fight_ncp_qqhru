// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'out_people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Out_people _$Out_peopleFromJson(Map<String, dynamic> json) {
  return Out_people()
    ..createdAt = json['createdAt'] as String
    ..objectId = json['objectId'] as String
    ..out_answer1 = json['out_answer1'] as String
    ..out_answer2 = json['out_answer2'] as String
    ..out_answer3 = json['out_answer3'] as String
    ..out_answer4 = json['out_answer4'] as String
    ..out_answer5 = json['out_answer5'] as String
    ..out_answer6 = json['out_answer6'] as String
    ..out_people_id = json['out_people_id'] as num
    ..ref_content_id = json['ref_content_id'] as num
    ..ref_survey_id = json['ref_survey_id'] as num
    ..updatedAt = json['updatedAt'] as String;
}

Map<String, dynamic> _$Out_peopleToJson(Out_people instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'objectId': instance.objectId,
      'out_answer1': instance.out_answer1,
      'out_answer2': instance.out_answer2,
      'out_answer3': instance.out_answer3,
      'out_answer4': instance.out_answer4,
      'out_answer5': instance.out_answer5,
      'out_answer6': instance.out_answer6,
      'out_people_id': instance.out_people_id,
      'ref_content_id': instance.ref_content_id,
      'ref_survey_id': instance.ref_survey_id,
      'updatedAt': instance.updatedAt
    };
