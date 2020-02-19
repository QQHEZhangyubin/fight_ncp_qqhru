import 'package:fight_ncp_qqhru/models/survey_content.dart';
import 'package:flutter/material.dart';

class PreViewItemLayout extends StatefulWidget{
  BuildContext buildContext;
  Survey_content urvey_content;
  PreViewItemLayout(BuildContext context, Survey_content survey_content){
    buildContext = context;
    urvey_content = survey_content;
  }

  @override
  State<StatefulWidget> createState() {

    return _PreViewItemLayoutState(buildContext,urvey_content);
  }

}

class _PreViewItemLayoutState extends State<PreViewItemLayout> {
  BuildContext _context;
  Survey_content _survey_content;
  List<String> _choosees = [];
  _PreViewItemLayoutState(BuildContext buildContext, Survey_content survey_content){
    if(survey_content == null){
      print('survey_content ==========null');
    }
    _context = buildContext;
    _survey_content = survey_content;
    print('zhi xing le ma?');

    if(_survey_content.option1 != null && _survey_content.option1.length != 0){
      _choosees.add(_survey_content.option1);
    }
    if(_survey_content.option2 != null && _survey_content.option2.length != 0){
      _choosees.add(_survey_content.option2);
    }
    if(_survey_content.option3 != null && _survey_content.option3.length != 0){
      _choosees.add(_survey_content.option3);
    }
    if(_survey_content.option4 != null && _survey_content.option4.length != 0){
      _choosees.add(_survey_content.option4);
    }
    if(_survey_content.option5 != null && _survey_content.option5.length != 0){
      _choosees.add(_survey_content.option5);
    }
    if(_survey_content.option6 != null && _survey_content.option6.length != 0){
      _choosees.add(_survey_content.option6);
    }
  }


  @override
  Widget build(BuildContext context) {
    Widget itemWidget;
    if(_survey_content.problem_type == '单选'){
      itemWidget = new Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white70,Colors.white],
              center: Alignment.topCenter,
              radius: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
              )
            ]
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_survey_content.problem_content ,style: TextStyle(color: Colors.red,fontSize: 18),),
            Divider(color: Colors.orange),
//            Expanded(
//              child:
            ListView.builder(
              shrinkWrap: true,
              itemExtent: 50,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _choosees.length,
              itemBuilder: (context,index){
                return RadioListTile(
                  value: -1,
//                  groupValue: _radioGroupValue,
//                  onChanged: _handleRadioValue,
//                  activeColor: Colors.red,
                  title: Text(_choosees[index]),
                );
              },
            ),
//            )
          ],
        ),
      );
    }
    else if(_survey_content.problem_type == '多选'){
      itemWidget = new Container(
        margin:EdgeInsets.all(10.0) ,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white70,Colors.white],
              radius: 2.0,
              center: Alignment.topCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
              )
            ]
        ),
        width: MediaQuery.of(context).size.width,
//          decoration: BoxDecoration(
//            color: Colors.red
//          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_survey_content.problem_content,style: TextStyle(color: Colors.red,fontSize: 18),),
            Divider(color: Colors.orange),
//              Expanded(
//                child:
            ListView.builder(
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              itemExtent: 50,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _choosees.length,
              itemBuilder: (context,index){
                return CheckboxListTile(
                  value: false,
                  title: Text(_choosees[index]),
                );
              },
            ),
//              ),
          ],
        ),
      );
    }
    else if(_survey_content.problem_type == '问答'){
      itemWidget = new Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white54,Colors.white],
              radius: 3.0,
              center: Alignment.topCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
              )
            ]
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_survey_content.problem_content,style: TextStyle(color: Colors.red,fontSize: 18),),
            Divider(color: Colors.orange),
            TextField(
              maxLines: 5,
              autofocus: false,
              decoration: InputDecoration(
                hintText: '请输入...',
                helperMaxLines: 3,
                hintMaxLines: 3,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      child: itemWidget,
    );
  }
}