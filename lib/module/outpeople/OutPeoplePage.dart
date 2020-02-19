
//import 'dart:html';


import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/utils/SingletonAnswer.dart';
import 'package:fight_ncp_qqhru/widget/problemitemlayout.dart';
import 'package:flutter/material.dart';

class OutPeoplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OutPeoplePageState();
  }
}


class _OutPeoplePageState extends State<OutPeoplePage>{
 List<Survey_content> _list = new List();
 String _title = '  ';
 String _description ='关于这张表的简单介绍';
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
      bodywidget =  Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
//            Text(_title),
            Text(_description,style: TextStyle(fontSize: 16),),
//            Expanded(
//              child:
              ListView.builder(
//                addAutomaticKeepAlives: true,
                itemBuilder: (context,index){
                  return ProblemItemLayout(context,_list[index]);
                },
                itemCount: _list.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
//            ),
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

                  bool flag = true;
                  for(int i = 0,j=0;i<keylist.length;i++,j++){
                      num ref_content_id = keylist[i];
                      String answer = valuelist[j];
                      if(answer.startsWith("[") && answer.endsWith("]")){
                        //回答的是多选题,内容里面会出现null
                        // print(answer);
                        Out_people out_people = new Out_people();
                        out_people.ref_content_id = ref_content_id;
                        out_people.out_answer1 = answer;
                        out_people.out_answer2 =" ";
                        out_people.out_answer3 =" ";
                        out_people.out_answer4 =" ";
                        out_people.out_answer5 =" ";
                        out_people.out_answer6 =" ";
                       List<String> anss =  answer.split(",");
                       int length = anss.length;
                        for(int i =0;i<length;i++){
                          if(i==0) {
                            print(anss[0].substring(1,anss[0].length));
                            out_people.out_answer1 = anss[0].substring(1,anss[0].length);
                          }
                          else{
                            print(anss[i]);
                            if(i == 1) out_people.out_answer2 = anss[i];
                            if(i == 2) out_people.out_answer3 = anss[i];
                            if(i == 3) out_people.out_answer4 = anss[i];
                            if(i == 4) out_people.out_answer5 = anss[i];
                            if(i== 5) out_people.out_answer6 = anss[length-1].substring(0,anss[length-1].length-1);
                          }
                        }
                        out_people.save().then((data){

                        }).catchError((e){
                          flag = false;
                          showError(context, '插入失败');
                        });

                      }else{
                        //回答的是选择和填空
                        Out_people out_people = new Out_people();
                        out_people.ref_content_id = ref_content_id;
                        out_people.out_answer1 = answer;
                        out_people.out_answer2 =" ";
                        out_people.out_answer3 =" ";
                        out_people.out_answer4 =" ";
                        out_people.out_answer5 =" ";
                        out_people.out_answer6 =" ";
                        out_people.save().then((BmobSaved bmobsaved){
//                          showSuccess(context, '单选和填空插入成功');
                        }).catchError((e){
                          flag = false;
                          showError(context, '插入失败');
                        });
                      }
                  }
                  if(flag){
                    showSuccess(context, '提交成功');
                    //返回到主页面
                  }
//                  BmobQuery d = new BmobQuery();
//                  d.queryObjectsByTableName('out_people').then((data){
//                    print(data.toString());
//                  }).catchError((e){
//                  });
//
//                  Out_people out_people = new Out_people();


                },
            ),
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
    BmobQuery query = new BmobQuery();
    query.queryObjectByTableName('30ddf4f7e1', 'Survey').then((data) {
      num survey_id = Survey.fromJson(data).survey_id;
      String survey_state = Survey.fromJson(data).survey_state;
      String survey_tiitle = Survey.fromJson(data).survey_title;
      String survey_description = Survey.fromJson(data).survey_description;
      String survey_time = Survey.fromJson(data).createdAt;

      print(survey_id);
      query.queryObjectsByTableName('Survey_content').then((value){
        List<Survey_content> survercontents = value.map((i) => Survey_content.fromJson(i)).toList();
        for(int i =0;i<survercontents.length;i++){
          if(survercontents[i].ref_survey_id == survey_id){
//            survercontents.removeAt(i);
            _list.add(survercontents[i]);
          }
        }
        print(survercontents.length);
        setState(() {
          _title = survey_tiitle;
          _description = survey_description;
          _list;
//          _list = survercontents;
        });
      }).catchError((e){
      });
    }).catchError((e){
    });
    super.initState();

  }


}