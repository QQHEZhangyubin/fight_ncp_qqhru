import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/module/student/InOutInfo.dart';
import 'package:fight_ncp_qqhru/module/student/UpdateStuInfo.dart';
import 'package:fight_ncp_qqhru/module/student/qr_page.dart';
import 'package:fight_ncp_qqhru/module/student/stusurvey.dart';
import 'package:fight_ncp_qqhru/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_Home_Page extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Student_Home_PageState();
  }
}

class _Student_Home_PageState extends State<Student_Home_Page> {

  List<Survey> _list;
  String _xuehao =" ";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   Widget bodywidget;
   if(_list == null || _list.length == 0){
     bodywidget = new Center(
       child: CircularProgressIndicator(),
     );
   }else{
     bodywidget  = new ListView.separated(
         itemBuilder: (context,index){
           return Container(
             width: MediaQuery.of(context).size.width,
             child: Card(
               elevation: 15.0,
               shape: const RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(14.0)),
               ),
               child: Column(
                 children: <Widget>[
                   ListTile(
                     title: Text(_list[index].survey_title,
                       style: TextStyle(fontWeight: FontWeight.w500),
                     ),
                     subtitle: Text('公告状态：' + _list[index].survey_state,style: TextStyle(
                       color: _list[index].survey_state == Constant.surveycurstate ?
                       Colors.redAccent: Colors.grey,
                     ),),
                     trailing:(_list[index].survey_type == '文本') ? null: IconButton(
                         icon: Icon(
                           _list[index].survey_state == Constant.surveycurstate ? Icons.mode_edit:Icons.done,
                           color:
                           _list[index].survey_state == Constant.surveycurstate ?
                           Colors.redAccent: Colors.grey,),
                         onPressed: (){
                              if(_list[index].survey_state == Constant.surveycurstate){
                                // do something
//                                      Navigator.pushNamed(context, Constant.student_survey_page);
                                      Navigator.push<String>(context,new MaterialPageRoute(builder: (BuildContext context){
                                        return new StuProblemPage(title: _list[index].survey_title,surveyid: _list[index].survey_id,xuehao: _xuehao,);
                                      }));
                              }
                         },
                     ),
                   ),
                   Divider(),
                   ListTile(
                     title: Text(_list[index].survey_description +"\n"),
                     subtitle: Text(_list[index].createdAt),
                   ),
                 ],
               ),
             ),
           );
         },
         separatorBuilder: (context ,index){
           return Divider(color: Colors.grey,);
         }, 
         itemCount: _list.length,
     );
   }
    return Scaffold(
      appBar: AppBar(
        title: Text('公告页面'),
      ),
      body: bodywidget,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Flexible(
              child: UserAccountsDrawerHeader(
                accountName: Text(_xuehao),
                currentAccountPicture: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://www.itying.com/images/flutter/3.png'),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('http://pics.sc.chinaz.com/files/pic/pic9/202001/zzpic22635.jpg'),
                      fit:BoxFit.cover,
                    )
                ),
//                otherAccountsPictures: <Widget>[
//                  Image.network('https://www.itying.com/images/flutter/4.png'),
//                  Image.network('https://www.itying.com/images/flutter/5.png'),
//                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text('学生认证'),
              subtitle: Text('生成你的学生信息'),
              onTap: (){
//                Navigator.p
                Navigator.push<String>(context,new MaterialPageRoute(builder: (BuildContext context){
                  return new Qr_page(title: _xuehao);
                }));
//                Navigator.pushNamed(context, Constant.student_qrinfo_page);
              },
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.info_outline),
              ),
              title: Text('添加个人信息'),
              onTap: (){
//                Navigator.pushNamed(context, Constant.student_updateinfo_page);
                  Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                    return new UpdateStudInfo(title: _xuehao);
                  }));
              },
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.reorder),
              ),
              title: Text('个人出入信息'),
              subtitle: Text('出入记录表'),
              onTap: (){
                Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                  return new InAndOutPage(title: _xuehao);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {

    BmobQuery bmobQuery = new BmobQuery();
    bmobQuery.queryObjectsByTableName('Survey').then((data) async {
      List<Survey> surveys = data.map((i) => Survey.fromJson(i)).toList();
//      _list = surveys;
      SharedPreferences prefs = await SharedPreferences.getInstance();
//    print(prefs.getString(Constant.stuobjectid) );
      String objectid = prefs.getString(Constant.stuobjectid);
      String stuid = prefs.getString(Constant.studenId);
      print('gggggggggggggggggggg' + objectid);
      print('gggggggggggggggggggg' + stuid);
      setState(() {
        _list = surveys;
        _xuehao = stuid;
        //TODO：目前只是简单的把第一个对象给移除，表示不取外来人员调查表的公告
        _list.removeAt(0);
      });
//      bmobQuery.queryObject(objectid).then((value){
//        print(value.toString());
//        Student st = Student.fromJson(value);
//        print('ppppppppppp' + st.toString());
//        setState(() {
//          _list = surveys;
//          _xuehao = st.student_id;//学号
//          print('xxxxxxxxxxxxxxx'+ st.student_id);
//        });
//      }).catchError((e){
//      });
//      getobjectId(surveys);
//      setState(() {
//        _list = surveys;
//      });
    }).catchError((e){
      showError(context, BmobError.convert(e).error);
    });



    super.initState();

  }

  void getobjectId(List<Survey> surveys) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
//    print(prefs.getString(Constant.stuobjectid) );
    String objectid = prefs.getString(Constant.stuobjectid);
    print('gggggggggggggggggggg' + objectid);
    BmobQuery que = new BmobQuery();
    que.queryObject(objectid).then((value){
      print(value.toString());
      Student st = Student.fromJson(value);
      print('ppppppppppp' + st.toString());
      setState(() {
        _list = surveys;
        _xuehao = st.student_id;//学号
        print('xxxxxxxxxxxxxxx'+ st.student_id);
      });
    }).catchError((e){
    });
  }
}