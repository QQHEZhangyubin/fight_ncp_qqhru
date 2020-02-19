import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:flutter/material.dart';

class Test1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Test1State();
  }

}

class _Test1State extends State<Test1> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }

  @override
  void initState() {
//    BmobQuery bmob = new BmobQuery();
//    bmob.queryObjectByTableName('814a6191eb','Survey').then((data){
//      print(Survey.fromJson(data).survey_id);
//    });
      Survey_content survey_content = new Survey_content();
      survey_content.option1 = 'option1';
      survey_content.option2 = 'option2';
      survey_content.option3 = 'option3';
      survey_content.option4 = 'option4';
      survey_content.option5 = 'option5';
      survey_content.option6 = 'option6';
      survey_content.problem_type = '单选';
      survey_content.problem_content = 'which you choose ?';
      survey_content.ref_survey_id = 1;
//      survey_content.question_id = 0;

      survey_content.save().then((BmobSaved bmobSaved){
        showSuccess(context, 'success');
      }).catchError((e){
        showError(context, BmobError.convert(e).error);
      });

  }
}