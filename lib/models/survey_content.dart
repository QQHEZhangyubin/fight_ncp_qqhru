import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'survey_content.g.dart';

@JsonSerializable()
class Survey_content extends BmobObject {
    Survey_content();

    String createdAt;
    String objectId;
    String option1;
    String option2;
    String option3;
    String option4 ;
    String option5;
    String option6;
    String problem_content;
    String problem_type;
    num question_id;
    num ref_survey_id;
    String updatedAt;
    
    factory Survey_content.fromJson(Map<String,dynamic> json) => _$Survey_contentFromJson(json);
    Map<String, dynamic> toJson() => _$Survey_contentToJson(this);

  @override
  Map getParams() {
    // TODO: implement getParams
    return toJson();
  }
}
