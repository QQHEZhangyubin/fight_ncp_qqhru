import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/module/administrator/designproblem/Single.dart';
import 'package:fight_ncp_qqhru/module/administrator/designproblem/TianKongProblem.dart';
import 'package:fight_ncp_qqhru/module/administrator/text_and_survey/preview_item_layout.dart';
import 'package:flutter/material.dart';

class DesignProblemPage extends StatefulWidget{
  final Survey_content survey_content;
  final String objectid;
  DesignProblemPage({Key key,this.survey_content,this.objectid}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DesignProblemPageState(survey_content,objectid);
  }

}

class _DesignProblemPageState extends State<DesignProblemPage> with SingleTickerProviderStateMixin{
  static List<Survey_content> _list = [];
  int _currentIndex = 0;
  List<String> nameItems = <String>['单选题','多选题','填空题'];
  List<String> urlItems = <String>['imgs/single.png','imgs/multiply.png','imgs/text.png'];

  String _objectid;
  static num _serveyid = -1;
  _DesignProblemPageState(Survey_content survey_content, String objectid){
    _objectid = objectid;
    if(survey_content != null){
//      print(survey_content.problem_content + survey_content.option1);
      _list.add(survey_content);
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    if(_list.length == 0){
      bodyWidget = new Center(
        child: Text('请添加题目'),
      );
    }else{
      bodyWidget = new ListView.builder(
          itemBuilder: (context,index){
              return PreViewItemLayout(context,_list[index]);
          },
          itemCount: _list.length,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑调查'),
      ),
      body: bodyWidget,
      bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white70,
                ),
              title: Text(
                '添加',
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.orange,
                ),
                title:Text('设置'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.save,
                  color: Colors.redAccent,
                ),
                title: Text('保存'),
            ),
          ],
        currentIndex: _currentIndex,
        onTap: (int index){
          print(index);
          _currentIndex = index;
          if(_currentIndex == 0){
            print('点击了添加按钮');
            //长按从底部弹框
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context){
                return _shareWidget(context);
              },
            );
          }
          else if(_currentIndex == 1){
            print('点击了设置按钮');
          }
          else if(_currentIndex == 2){
            print('点击了保存按钮');
            bool flag = true;
            for(int i=0;i<_list.length;i++){

              _list[i].save().then((BmobSaved bmobSaved){

              }).catchError((e){
                showError(context, BmobError.convert(e).error);
                flag = false;
              });
            }
            if(flag){
              showSuccess(context, '添加成功');
            }


          }

        },
      )
    );
  }

  @override
  void initState() {
    if(_objectid != null){
      BmobQuery bmob = new BmobQuery();
      bmob.queryObjectByTableName(_objectid,'Survey').then((data){
        num id = Survey.fromJson(data).survey_id;
        setState(() {
          _serveyid = id;
          _list.clear();
        });
      }).catchError((e){
        showError(context, BmobError.convert(e).error);
      });
    }

  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _shareWidget(BuildContext context) {
    return Container(
      height: 290.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              height: 220.0,
              child: GridView.builder(
                itemCount: urlItems.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                        child: GestureDetector(
                          child: Image.asset(
                            urlItems[index],
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.fill,
                          ),
                          onTap: (){
                            Navigator.pop(context);
                            print(nameItems[index]);
                            if(nameItems[index] == '单选题'){
                                Navigator.push(context, new MaterialPageRoute(builder: (context){
                                  return SinglePage(survey_id: _serveyid,problemtype: '单选',);
                                }));
                            }
                            else if(nameItems[index] == '多选题'){
                              Navigator.push(context, new MaterialPageRoute(builder: (context){
                                return SinglePage(survey_id: _serveyid,problemtype: '多选',);
                              }));
                            }
                            else if(nameItems[index] == '填空题'){
                              Navigator.push(context, new MaterialPageRoute(builder: (context){
                                return TianKongLayout(survey_id: _serveyid);
                              }));
                            }

                          },
                        ),
                      ),
                      Text(nameItems[index]),
                    ],
                  );
                },
              ),
            ),
          ),
          Divider(color: Colors.grey,),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('取消',style: TextStyle(fontSize: 18.0,color: Colors.blueGrey),)
              ),
            ),
          ),
        ],
      ),
    );
  }

}