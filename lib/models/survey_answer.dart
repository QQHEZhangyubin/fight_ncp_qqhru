import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'survey_answer.g.dart';

@JsonSerializable()
class Survey_answer extends BmobObject{
    Survey_answer();

    String answer1;
    String answer2;
    String answer3;
    String answer4;
    String answer5;
    String answer6;
    String createdAt;
    String objectId;
    num ref_content_id;
    String ref_student_id;
    num ref_survey_id;
    num survey_answer_id;
    String updatedAt;
    
    factory Survey_answer.fromJson(Map<String,dynamic> json) => _$Survey_answerFromJson(json);
    Map<String, dynamic> toJson() => _$Survey_answerToJson(this);

  @override
  Map getParams() {
    // TODO: implement getParams
    return toJson();
  }
}
