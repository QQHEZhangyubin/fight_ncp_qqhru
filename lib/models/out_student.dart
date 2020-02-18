import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'out_student.g.dart';

@JsonSerializable()
class Out_student  extends BmobObject{
    Out_student();

    String createdAt;
    String objectId;
    String out_date;
    num out_student_id;
    String ref_administrator_id;
    String ref_student_id;
    String updatedAt;
    
    factory Out_student.fromJson(Map<String,dynamic> json) => _$Out_studentFromJson(json);
    Map<String, dynamic> toJson() => _$Out_studentToJson(this);

  @override
  Map getParams() {
    // TODO: implement getParams
    return toJson();
  }
}
