// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student()
    ..student_id = json['student_id'] as String
    ..student_pw = json['student_pw'] as String
    ..college = json['student_college'] as String
    ..student_class = json['student_class'] as String
    ..student_level = json['student_level'] as String
    ..student_major = json['student_major'] as String
    ..brithday = json['student_brithday'] as String
    ..student_avar = json['student_avar'] as String
    ..identity_card = json['identity_card'] as String
    ..student_home = json['student_home'] as String
    ..objectId = json['objectId'] as String;
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'student_id': instance.student_id,
      'student_pw': instance.student_pw,
      'student_college': instance.college,
      'student_class': instance.student_class,
      'student_level': instance.student_level,
      'student_major': instance.student_major,
      'student_brithday': instance.brithday,
      'student_avar': instance.student_avar,
      'identity_card': instance.identity_card,
      'student_home': instance.student_home,
      'objectId' : instance.objectId
    };
