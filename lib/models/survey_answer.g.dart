// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey_answer _$Survey_answerFromJson(Map<String, dynamic> json) {
  return Survey_answer()
    ..answer1 = json['answer1'] as String
    ..answer2 = json['answer2'] as String
    ..answer3 = json['answer3'] as String
    ..answer4 = json['answer4'] as String
    ..answer5 = json['answer5'] as String
    ..answer6 = json['answer6'] as String
    ..createdAt = json['createdAt'] as String
    ..objectId = json['objectId'] as String
    ..ref_content_id = json['ref_content_id'] as num
    ..ref_student_id = json['ref_student_id'] as String
    ..ref_survey_id = json['ref_survey_id'] as num
    ..survey_answer_id = json['survey_answer_id'] as num
    ..updatedAt = json['updatedAt'] as String;
}

Map<String, dynamic> _$Survey_answerToJson(Survey_answer instance) =>
    <String, dynamic>{
      'answer1': instance.answer1,
      'answer2': instance.answer2,
      'answer3': instance.answer3,
      'answer4': instance.answer4,
      'answer5': instance.answer5,
      'answer6': instance.answer6,
      'createdAt': instance.createdAt,
      'objectId': instance.objectId,
      'ref_content_id': instance.ref_content_id,
      'ref_student_id': instance.ref_student_id,
      'ref_survey_id': instance.ref_survey_id,
      'survey_answer_id': instance.survey_answer_id,
      'updatedAt': instance.updatedAt
    };
