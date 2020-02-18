import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'administrator_info.g.dart';

@JsonSerializable()
class Administrator_info extends BmobObject {
    Administrator_info();

    String administrator_branch;
    String administrator_id;
    String administrator_level;
    String administrator_name;
    String createdAt;
    String objectId;
    String updatedAt;
    
    factory Administrator_info.fromJson(Map<String,dynamic> json) => _$Administrator_infoFromJson(json);
    Map<String, dynamic> toJson() => _$Administrator_infoToJson(this);

  @override
  Map getParams() {
    // TODO: implement getParams
    return toJson();
  }
}
