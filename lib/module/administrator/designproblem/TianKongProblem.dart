import 'package:fight_ncp_qqhru/models/survey_content.dart';
import 'package:flutter/material.dart';

import 'DesignProblem.dart';

class TianKongLayout extends StatefulWidget{
  final num survey_id;
  TianKongLayout({Key key,this.survey_id}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TianKongLayoutState(survey_id);
  }

}

class _TianKongLayoutState extends State<TianKongLayout> {

  String _title;
  num _surveyId;
  _TianKongLayoutState(num survey_id){
    _surveyId = survey_id;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('填空题'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('标题'),
          ),
          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              hintText: '请输入标题'
            ),
            onChanged: (v){
              _title = v;
            },
          ),
          RaisedButton(
              child: Text('保存'),
              onPressed: (){
                Survey_content surveyContent = new Survey_content();
                surveyContent.ref_survey_id = _surveyId;
                surveyContent.problem_content = _title;
                surveyContent.problem_type = '问答';
                surveyContent.option1 = null;
                surveyContent.option2 = null;
                surveyContent.option3 = null;
                surveyContent.option4 = null;
                surveyContent.option5 = null;
                surveyContent.option6 = null;
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context){
                return DesignProblemPage(survey_content: surveyContent,objectid: null,);
                }));
              }
          ),
        ],
      ),
    );
  }
}