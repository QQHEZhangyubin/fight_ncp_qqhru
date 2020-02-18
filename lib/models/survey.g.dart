// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return Survey()
    ..createdAt = json['createdAt'] as String
    ..objectId = json['objectId'] as String
    ..survey_description = json['survey_description'] as String
    ..survey_id = json['survey_id'] as num
    ..survey_initiator = json['survey_initiator'] as String
    ..survey_state = json['survey_state'] as String
    ..survey_title = json['survey_title'] as String
    ..updatedAt = json['updatedAt'] as String
    ..survey_type = json['survey_type'] as String
    ..access_obj = json['access_obj'] as String;
}

Map<String, dynamic> _$SurveyToJson(Survey instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'objectId': instance.objectId,
      'survey_description': instance.survey_description,
      'survey_id': instance.survey_id,
      'survey_initiator': instance.survey_initiator,
      'survey_state': instance.survey_state,
      'survey_title': instance.survey_title,
      'updatedAt': instance.updatedAt,
      'survey_type': instance.survey_type,
      'access_obj' : instance.access_obj
    };
