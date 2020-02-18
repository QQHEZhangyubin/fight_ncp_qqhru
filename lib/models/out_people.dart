import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'out_people.g.dart';

@JsonSerializable()
class Out_people extends BmobObject{
    Out_people();

    String createdAt;
    String objectId;
    String out_answer1;
    String out_answer2;
    String out_answer3;
    String out_answer4;
    String out_answer5;
    String out_answer6;
    num out_people_id;
    num ref_content_id;
    num ref_survey_id;
    String updatedAt;
    
    factory Out_people.fromJson(Map<String,dynamic> json) => _$Out_peopleFromJson(json);
    Map<String, dynamic> toJson() => _$Out_peopleToJson(this);

  @override
  Map getParams() {
    // TODO: implement getParams
    return toJson();
  }
}
