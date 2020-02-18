
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/module/administrator/homepage/administraror_HomePage_Repository.dart';

class Administraror_HomePage_Repository_Impl extends Administraror_HomePage_Repository{
   List<Survey> _list = new List();
  @override
    List<Survey> onLoadSurveytablesInfo() {
    BmobQuery query  = new BmobQuery();

//    query.queryObjectsByTableName("survey").then((data){
//      List<Survey> survey = data.map((i) => Survey.fromJson(i)).toList();
//      _list = survey;
//    }).catchError((e) => BmobError.convert(e).toString());
//    return _list;
    query.queryObjectsByTableName("survey").then((data) {
      List<Survey> survey = data.map((i) => Survey.fromJson(i)).toList();

      print(survey.length);
      _list = survey;
    }).catchError((e){

    });
//   return _list;
  }

  @override
  Future<Null> uploadnewSurveyInfo() {
    // TODO: implement uploadnewSurveyInfo
    return null;
  }

}