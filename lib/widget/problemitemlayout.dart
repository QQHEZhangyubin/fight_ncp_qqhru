


import 'dart:math';

import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/utils/SingletonAnswer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProblemItemLayout extends StatefulWidget{
  BuildContext _buildContext;
  Survey_content _survey_content;

  ProblemItemLayout(BuildContext context, Survey_content survey_content){
    _buildContext = context;
    _survey_content = survey_content;
  }

  @override
  State<StatefulWidget> createState() {
    print('***************************************************************************************************************');
    if(_survey_content.problem_type == '单选' && SingletonAnswer.instance.maplist.length != 0 &&
    SingletonAnswer.instance.maplist[_survey_content.question_id] != null){
      //取出用户已选择的选项：
      int chooseIndex = -1;
        if(SingletonAnswer.instance.maplist[_survey_content.question_id] == _survey_content.option1){
          chooseIndex = 0;
        }
        else if(SingletonAnswer.instance.maplist[_survey_content.question_id] == _survey_content.option2){
          chooseIndex = 1;
        }
        else if(SingletonAnswer.instance.maplist[_survey_content.question_id] == _survey_content.option3){
          chooseIndex = 2;
        }
        else if(SingletonAnswer.instance.maplist[_survey_content.question_id] == _survey_content.option4){
          chooseIndex = 3;
        }
        else if(SingletonAnswer.instance.maplist[_survey_content.question_id] == _survey_content.option5){
          chooseIndex = 4;
        }
        else if(SingletonAnswer.instance.maplist[_survey_content.question_id] == _survey_content.option6){
          chooseIndex = 5;
        }
        return _ProbllemItemLayoutState(_buildContext,_survey_content,chooseIndex,null,null);
    }
    if(_survey_content.problem_type == '多选' && SingletonAnswer.instance.maplist.length != 0 &&
    SingletonAnswer.instance.maplist[_survey_content.question_id] != null ){
     // print(SingletonAnswer.instance.maplist[_survey_content.question_id]);
      List<bool> checkboxes =[];
      if(_survey_content.option1 != null ){
        if(SingletonAnswer.instance.maplist[_survey_content.question_id].contains(_survey_content.option1)){
          checkboxes.add(true);
        }else{
          checkboxes.add(false);
        }
      }else{
        checkboxes.add(false);
      }
      if(_survey_content.option2 != null){
        if(SingletonAnswer.instance.maplist[_survey_content.question_id].contains(_survey_content.option2)){
          checkboxes.add(true);
        }else{
          checkboxes.add(false);
        }
      }else{
        checkboxes.add(false);
      }
      if(_survey_content.option3 != null){
        if(SingletonAnswer.instance.maplist[_survey_content.question_id].contains(_survey_content.option3)){
          checkboxes.add(true);
        }else{
          checkboxes.add(false);
        }
      }else{
        checkboxes.add(false);
      }
      if(_survey_content.option4 != null){
        if(SingletonAnswer.instance.maplist[_survey_content.question_id].contains(_survey_content.option4)){
          checkboxes.add(true);
        }else{
          checkboxes.add(false);
        }
      }else{
        checkboxes.add(false);
      }
      if(_survey_content.option5 != null){
        if(SingletonAnswer.instance.maplist[_survey_content.question_id].contains(_survey_content.option5)){
          checkboxes.add(true);
        }else{
          checkboxes.add(false);
        }
      }else{
        checkboxes.add(false);
      }
     if(_survey_content.option6 != null){
       if(SingletonAnswer.instance.maplist[_survey_content.question_id].contains(_survey_content.option6)){
         checkboxes.add(true);
       }else{
         checkboxes.add(false);
       }
     }else{
       checkboxes.add(false);
     }
      return _ProbllemItemLayoutState(_buildContext,_survey_content,-1,checkboxes,null);
    }
    else{
      //为填空题
      String text = SingletonAnswer.instance.maplist[_survey_content.question_id];

      return _ProbllemItemLayoutState(_buildContext,_survey_content,-1,null,text);
    }
  }

}

class _ProbllemItemLayoutState extends State<ProblemItemLayout> {



  BuildContext buildContext;
  Survey_content survey_content;
  num _quesid;
  String _type,_content,_option1,_option2,_option3,_option4,_option5,_option6;
  int _radioGroupValue = -1;
//  bool _checkboxSelected = false;

  List<String> choosees = new List();

  List<String> _checkBoxSelected = [];

  TextEditingController _editingController = new TextEditingController();

//  var _checkboxSelected;

  List<bool> checkboxbool = [false,false,false,false,false,false];

  _ProbllemItemLayoutState(BuildContext buildContext, Survey_content survey_content, int chooseIndex, List<bool> checkboxes, String text){
    this.buildContext = buildContext;
    this.survey_content = survey_content;
    _quesid = this.survey_content.question_id;
    _type = this.survey_content.problem_type;
    _content = this.survey_content.problem_content;
    _option1 = (this.survey_content.option1 != null && this.survey_content.option1.length != 0) ? this.survey_content.option1 : null ;
    _option2 = (this.survey_content.option2 != null && this.survey_content.option2.length != 0) ? this.survey_content.option2 : null ;
    _option3 = (this.survey_content.option3 != null && this.survey_content.option3.length != 0) ? this.survey_content.option3 : null ;
    _option4 = (this.survey_content.option4 != null && this.survey_content.option4.length != 0) ? this.survey_content.option4 : null ;
    _option5 = (this.survey_content.option5 != null && this.survey_content.option5.length != 0) ? this.survey_content.option5 : null ;
    _option6 = (this.survey_content.option6 != null && this.survey_content.option6.length != 0) ? this.survey_content.option6 : null ;


    if(_option1 != null){
      choosees.add(_option1);
    }
    if(_option2 != null){
      choosees.add(_option2);
    }
    if(_option3 != null){
      choosees.add(_option3);
    }
    if(_option4 != null){
      choosees.add(_option4);
    }
    if(_option5 != null){
      choosees.add(_option5);
    }

    if(_option6 != null){
      choosees.add(_option6);
    }

    _radioGroupValue = chooseIndex;

    if(checkboxes == null){
      //nothing to do
    }else{
      checkboxbool = checkboxes;
      //checkboxlool.lengh = 6
//      for(int i = 0;i<checkboxbool.length;i++){
        if(checkboxbool[0]  && (_option1 != null)) _checkBoxSelected.add(_option1);
        if(checkboxbool[1] && (_option2 != null)) _checkBoxSelected.add(_option2);
        if(checkboxbool[2] && (_option3 != null)) _checkBoxSelected.add(_option3);
        if(checkboxbool[3] && (_option4 != null)) _checkBoxSelected.add(_option4);
        if(checkboxbool[4] && (_option5 != null)) _checkBoxSelected.add(_option5);
        if(checkboxbool[5] && (_option6 != null)) _checkBoxSelected.add(_option6);
//      }
    }

    _editingController.text = text;
  }

  @override
  void initState() {
//    _editingController.text = "hkdsflkgjhkdlsvhfbgknhm"+Random.secure().nextInt(10).toString();
    _editingController.addListener((){
      print(_editingController.text);
      SingletonAnswer.instance.maplist.addAll({_quesid:_editingController.text});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget itemWidget;
    if(_type == '单选'){
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
            Text(_content ,style: TextStyle(color: Colors.red,fontSize: 18),),
            Divider(color: Colors.orange),
//            Expanded(
//              child:
              ListView.builder(
                  shrinkWrap: true,
                  itemExtent: 50,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: choosees.length,
                  itemBuilder: (context,index){
                    return RadioListTile(
                        value: index,
                        groupValue: _radioGroupValue,
                        onChanged: _handleRadioValue,
                        activeColor: Colors.red,
                        title: Text(choosees[index]),
                    );
                  },
              ),
//            )
          ],
        ),
      );
    } else if(_type == '多选'){
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
              Text(_content,style: TextStyle(color: Colors.red,fontSize: 18),),
              Divider(color: Colors.orange),
//              Expanded(
//                child:
                ListView.builder(
                    addAutomaticKeepAlives: true,
                    shrinkWrap: true,
                    itemExtent: 50,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: choosees.length,
                    itemBuilder: (context,index){
                      return CheckboxListTile(
                          value: checkboxbool[index],
                          onChanged: (value){
                              if(value){
                                print(choosees[index]);
                                _checkBoxSelected.add(choosees[index]);
                              }else{
                                print(choosees[index]);
                                _checkBoxSelected.remove(choosees[index]);
                              }
                              SingletonAnswer.instance.maplist.addAll({_quesid:_checkBoxSelected.toString()});
                           setState(() {
//                             print(choosees[index]);
                             checkboxbool[index] = value;
                           });
                          },
                          title: Text(choosees[index]),
                      );
                    },
                ),
//              ),
            ],
          ),
      );
    }else if(_type == '问答'){
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
            Text('$_content',style: TextStyle(color: Colors.red,fontSize: 18),),
            Divider(color: Colors.orange),
            TextField(
              maxLines: 5,
              autofocus: false,
              controller: _editingController,
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


  void _handleRadioValue(value) {
      SingletonAnswer.instance.maplist.addAll({_quesid:choosees[value]});
      setState(() {
        //TODO;记录用户选中的状态
        print('对于问题$_quesid,目前选中的状态：' + choosees[value]);
        _radioGroupValue = value;
      });
  }
}
