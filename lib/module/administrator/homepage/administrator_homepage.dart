import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_handled.dart';
import 'package:data_plugin/bmob/response/bmob_updated.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/module/administrator/homepage/administrator_homepage_presenter.dart';
import 'package:fight_ncp_qqhru/module/administrator/only_text_public/OnlyTextPublic.dart';
import 'package:fight_ncp_qqhru/module/administrator/text_and_survey/textandsurvey.dart';
import 'package:fight_ncp_qqhru/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdministratorHomePage extends StatefulWidget{
  final String initator;
  final String A;
  final String B;
  final String C;

  AdministratorHomePage({Key key,this.initator,this.A,this.B,this.C}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdministratorHomePageState(initator,A,B,C);
  }

}

class _AdministratorHomePageState extends State<AdministratorHomePage> implements Administrator_HomePageView{
  List<Survey> _survey;
  AdministratorPresenter _presenter;
  String _initator = '';
  String _a,_b,_c;
  _AdministratorHomePageState(String initator, String a,String b,String c){
    _initator = initator;
    _a = a;
    _b = b;
    _c = c;
  }
  List<String> nameItems = <String>['失效','激活','删除'];
  List<String> urlItems = <String>['imgs/end.png','imgs/active.png','imgs/delete.png'];

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    if(_survey == null || _survey.length == 0){
      bodyWidget = Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16.0),
          child: CircularProgressIndicator(),
        ),
      );
    }else{
      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      bodyWidget = ListView.separated(
          itemBuilder: (context,index){
            var survey_title = _survey[index].survey_title;
            var survey_description = _survey[index].survey_description;
            var survey_state = _survey[index].survey_state;
            var survey_time = _survey[index].createdAt;
            return Container(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onLongPress: (){
                  //长按从底部弹框
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return _shareWidget(context,_survey[index]);
                    },
                  );
                },
                child: Card(
                  elevation: 15.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('$survey_title',
                        style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('校级通告' + '$survey_state',style: TextStyle(
                          color: (survey_state == '进行中') ? Colors.red : Colors.grey,
                        ),),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('$survey_description' + '\n'),
                        subtitle: Text('$survey_time'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context,index){
            return Divider(color: Colors.green,);
          },
          itemCount: _survey.length,
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('管理员页面'),
      ),
      body: bodyWidget,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Flexible(
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('http://n.sinaimg.cn/sinacn21/508/w640h668/20180712/c5b4-hfefkqr2854832.jpg'),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://img.zcool.cn/community/0389d2056f0de586ac7257d20a4672a.jpg'),
                        fit:BoxFit.cover,
                    )
                  ),
                ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text(_a),
              subtitle: Text(_b),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.chrome_reader_mode),
              ),
              title: Text(_c),
              subtitle: Text('所属部门'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.endFloat ,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context,builder: (context){
              return SimpleDialog(
                title: Text('内容发布'),
                children: <Widget>[
                  SimpleDialogOption(
                    child: Text('发布公告'),
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context, new MaterialPageRoute(builder: (context){
                        return new OnlyTextPublic(initatorid: _initator,);
                      }));

//                      Navigator.pushNamed(context, Constant.text_public_page);
                    },
                  ),
                        //TODO:接着做，完成自定义发布调查卷功能
                  SimpleDialogOption(
                    child: Text('发布调查卷'),
                    onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, new MaterialPageRoute(builder: (context){
                          return new TextAndSurvey(initatorid: _initator,);
                        }));
                    },
                  ),
                ],
              );
            });
          },
          child: Icon(Icons.mode_edit),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void initState() {
//    _presenter = new AdministratorPresenter(this);
//    _presenter.pulltableInfo();

    BmobQuery query  = new BmobQuery();
    query.queryObjectsByTableName("Survey").then((data) {
      List<Survey> survey = data.map((i) => Survey.fromJson(i)).toList();

      print(survey.length);
     setState(() {
       _survey = survey;
     });

    }).catchError((e){

    });

    super.initState();
  }

  @override
  void loadSurveytableInfo_Fail() {
    // TODO: implement loadSurveytableInfo_Fail
  }

  @override
  void loadSurveytableInfo_Success(List<Survey> surveylist) {
//    // TODO: implement loadSurveytableInfo_Success
//    print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy' + surveylist.length.toString());
//    print(surveylist[0].survey_description);
//    setState(() {
//      _survey = surveylist;
//    });
  }

  Widget _shareWidget(BuildContext context, Survey survey) {

    return Container(
      height: 190.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              height: 100.0,
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

                            if(nameItems[index] == '删除'){
                                survey.delete().then((BmobHandled bmobHandled){
                                  Navigator.pop(context);

                                    showSuccess(context,'该公告已删除,查看最新状态需重新登陆');
                                }).catchError((e){
                                  showError(context, BmobError.convert(e).error);
                                });
                            }
                            else if(nameItems[index] == '激活'){
                                survey.survey_state = '进行中';
                                survey.update().then((BmobUpdated bmobUpdated){
                                  Navigator.pop(context);
                                  showSuccess(context, '激活成功,查看最新状态需重新登陆');

                                }).catchError((e){
                                  showError(context, BmobError.convert(e).error);
                                });
                            }
                            else if(nameItems[index] == '失效'){
                                survey.survey_state = '结束';
                                survey.update().then((BmobUpdated bmobUpdated){
                                  Navigator.pop(context);
                                  showSuccess(context, '终止成功,查看最新状态需重新登陆');
                                }).catchError((e){
                                  showError(context, BmobError.convert(e).error);
                                });
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