// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey_content _$Survey_contentFromJson(Map<String, dynamic> json) {
  return Survey_content()
    ..createdAt = json['createdAt'] as String
    ..objectId = json['objectId'] as String
    ..option1 = json['option1'] as String
    ..option2 = json['option2'] as String
    ..option3 = json['option3'] as String
    ..option4 = json['option4'] as String
    ..option5 = json['option5'] as String
    ..option6 = json['option6'] as String
    ..problem_content = json['problem_content'] as String
    ..problem_type = json['problem_type'] as String
    ..question_id = json['question_id'] as num
    ..ref_survey_id = json['ref_survey_id'] as num
    ..updatedAt = json['updatedAt'] as String;
}

Map<String, dynamic> _$Survey_contentToJson(Survey_content instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'objectId': instance.objectId,
      'option1': instance.option1,
      'option2': instance.option2,
      'option3': instance.option3,
      'option4': instance.option4,
      'option5': instance.option5,
      'option6': instance.option6,
      'problem_content': instance.problem_content,
      'problem_type': instance.problem_type,
      'question_id': instance.question_id,
      'ref_survey_id': instance.ref_survey_id,
      'updatedAt': instance.updatedAt
    };
