import 'package:fight_ncp_qqhru/models/administrator_info.dart';

abstract class Administrator_Login_Repository{
  Future<String> login(Administrator_info administrator_info);
}
