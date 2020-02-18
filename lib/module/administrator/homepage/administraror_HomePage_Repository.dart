
import 'package:fight_ncp_qqhru/models/survey.dart';

abstract class Administraror_HomePage_Repository{
  List<Survey> onLoadSurveytablesInfo();//定义一个从bmob云服务中拉取数据的方法
  Future<Null> uploadnewSurveyInfo();//定义一个将调查表信息上传到bmob云服务的方法

}