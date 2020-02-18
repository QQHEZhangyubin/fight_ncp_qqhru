import 'package:fight_ncp_qqhru/models/administrator_info.dart';
import 'package:fight_ncp_qqhru/module/administrator/login/administrator_login_repository.dart';
import 'package:fight_ncp_qqhru/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Administrator_Login_Repository_Impl extends Administrator_Login_Repository{
  @override
  Future<String> login(Administrator_info administrator_info) async{
    //持久化登陆成功后，用户的信息
    //将查到的用户信息持久化到本地
    print(administrator_info.toString());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Constant.administrator_id, administrator_info.administrator_id);
    preferences.setString(Constant.administrator_branch, administrator_info.administrator_branch);
    preferences.setString(Constant.administrator_level, administrator_info.administrator_level);
    preferences.setString(Constant.administrator_name, administrator_info.administrator_name);
    return null;
  }

}