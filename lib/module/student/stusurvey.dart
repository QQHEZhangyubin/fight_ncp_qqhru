
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/models/survey_content.dart';
import 'package:fight_ncp_qqhru/utils/SingletonAnswer.dart';
import 'package:fight_ncp_qqhru/widget/problemitemlayout.dart';
import 'package:flutter/material.dart';

class StuProblemPage extends StatefulWidget{


  final String title;
  final num surveyid;
  final String xuehao;
  StuProblemPage({Key key,this.title,this.surveyid,this.xuehao}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _StuProblemPageState(title,surveyid,xuehao);
  }
}
class _StuProblemPageState extends State<StuProblemPage> {
  List<Survey_content> _list = [];
  String _title = '';
  num _surveyid;
  String _xuehao ='';
  _StuProblemPageState(String title, num surveyid, String xuehao){
    _title = title;
    _surveyid = surveyid;
    _xuehao = xuehao;
  }
  @override
  Widget build(BuildContext context) {
    Widget bodywidget;
    if(_list == null || _list.length ==0){
      bodywidget = Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16.0),
          child: CircularProgressIndicator(),
        ),
      );
    }else{
        bodywidget  = new Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[

               ListView.builder(
//                addAutomaticKeepAlives: true,

                  itemBuilder: (context,index){
                    return ProblemItemLayout(context,_list[index]);
                  },
                  itemCount: _list.length,
                  shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
               ),

              RaisedButton(
                  child: Text('提交'),
                  onPressed: (){
                    print(SingletonAnswer.instance.maplist);
                    print(SingletonAnswer.instance.maplist.keys.toList().toString());
                    print(SingletonAnswer.instance.maplist.values.toList().toString());
                    List<num> keylist = SingletonAnswer.instance.maplist.keys.toList();
                    List<String> valuelist = SingletonAnswer.instance.maplist.values.toList();

                    if(keylist.length != _list.length){
                      showError(context, '你还有问题没有回答');
                      return;
                    }
                  //////////////////////////////
                      bool flag = true;
                      for(int i = 0,j=0;i<keylist.length;i++,j++){
                      num ref_content_id = keylist[i];
                      String answer = valuelist[j];

                      if(answer.startsWith("[") && answer.endsWith("]")){
                        //回答的是多选题,内容里面估计(不会)出现null
                        Survey_answer surveyanswer = new Survey_answer();
                        surveyanswer.ref_content_id = ref_content_id;
                        surveyanswer.ref_student_id = _xuehao;
                        surveyanswer.ref_survey_id= _surveyid;
                        surveyanswer.answer1 = answer;
                        surveyanswer.answer2 = " ";
                        surveyanswer.answer3 = " ";
                        surveyanswer.answer4 = " ";
                        surveyanswer.answer5 = " ";
                        surveyanswer.answer6 = " ";
                        List<String> anss =  answer.split(",");
                        int length = anss.length;
                        for(int i =0;i<length;i++){
                          if(i==0) {
                            print(anss[0].substring(1,anss[0].length));
                            surveyanswer.answer1= anss[0].substring(1,anss[0].length);
                          }
                          else{
                            print(anss[i]);
                            if(i == 1) surveyanswer.answer2 = anss[i];
                            if(i == 2) surveyanswer.answer3 = anss[i];
                            if(i == 3) surveyanswer.answer4 = anss[i];
                            if(i == 4) surveyanswer.answer5 = anss[i];
                            if(i== 5) surveyanswer.answer6 = anss[length-1].substring(0,anss[length-1].length-1);
                          }
                        }

                        surveyanswer.save().then((BmobSaved bmobsaved){

                        }).catchError((e){
                          showError(context, '插入失败');
                        });




                      }else{
                        //回答的是选择和填空
                        Survey_answer surveyanswer = new Survey_answer();
                        surveyanswer.ref_content_id = ref_content_id;
                        surveyanswer.ref_student_id = _xuehao;
                        surveyanswer.ref_survey_id= _surveyid;
                        surveyanswer.answer1 = answer;
                        surveyanswer.answer2 = " ";
                        surveyanswer.answer3 = " ";
                        surveyanswer.answer4 = " ";
                        surveyanswer.answer5 = " ";
                        surveyanswer.answer6 = " ";
                        surveyanswer.save().then((BmobSaved bmobsaved){

                        }).catchError((e){
                          showError(context, '插入失败');
                        });
                      }
                      }
                    if(flag){
                      showSuccess(context, '提交成功');
//                      Navigator.of(context).pop();
                      //返回到主页面
                    }

                      ////////////////////////////////////////////////
                  },
              )
            ],
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: bodywidget,
    );
  }

  @override
  void initState() {
    num  survey_id = _surveyid;
    BmobQuery query = new BmobQuery();
    query.queryObjectsByTableName('Survey_content').then((data) {
      List<Survey_content> survercontents = data.map((i) => Survey_content.fromJson(i)).toList();
      for(int i =0;i<survercontents.length;i++){
        if(survercontents[i].ref_survey_id == survey_id){
//          survercontents.removeAt(i);
          _list.add(survercontents[i]);
        }
      }
      print(survercontents.length);
      setState(() {
        _list;
      });
    }).catchError((e){
      showError(context, BmobError.convert(e).error);
    });
    super.initState();
  }
}