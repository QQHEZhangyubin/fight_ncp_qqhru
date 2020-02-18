import 'package:data_plugin/bmob/bmob.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'survey.g.dart';

@JsonSerializable()
class Survey extends BmobObject{
    Survey();

    @override
    String toString() {
        return 'Survey{createdAt: $createdAt, objectId: $objectId, survey_description: $survey_description, survey_id: $survey_id, survey_initiator: $survey_initiator, survey_state: $survey_state, survey_title: $survey_title, updatedAt: $updatedAt, survey_type: $survey_type}';
    }

    String createdAt;
    String objectId;
    String survey_description;

    num survey_id;
    String survey_initiator;
    String survey_state;
    String survey_title;
    String updatedAt;
    String survey_type;
    String access_obj;
    factory Survey.fromJson(Map<String,dynamic> json) => _$SurveyFromJson(json);
    Map<String, dynamic> toJson() => _$SurveyToJson(this);

  @override
  Map getParams() {
    // TODO: implement getParams
    return toJson();
  }
}
