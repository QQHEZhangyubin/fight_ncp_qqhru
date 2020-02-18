import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends BmobObject{
    Student();

    @override
    String toString() {
        return 'Student{student_id: $student_id, student_pw: $student_pw, college: $college, student_class: $student_class, student_level: $student_level, student_major: $student_major, brithday: $brithday, student_avar: $student_avar, identity_card: $identity_card, student_home: $student_home, objectId: $objectId}';
    }

    String student_id;
    String student_pw;
    String college;
    String student_class;
    String student_level;
    String student_major;
    String brithday;
    String student_avar;
    String identity_card;
    String student_home;
    String objectId;
    
    factory Student.fromJson(Map<String,dynamic> json) => _$StudentFromJson(json);
    Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  Map getParams() {
    // TODO: implement getParams
    return toJson();
  }
}
