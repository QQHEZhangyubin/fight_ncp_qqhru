
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_updated.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:flutter/material.dart';

class UpdateStudInfo extends StatefulWidget{
  final String title;
  UpdateStudInfo({Key key,this.title}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdateStudInfoState(title);
  }

}

class _UpdateStudInfoState extends State<UpdateStudInfo> {
  String _xuehao;
  _UpdateStudInfoState(String title){
    _xuehao = title;
    print(_xuehao  + "kkkkkkkkkkkkkkkkk");
  }
  String _OBJECTID;
  Student _student;
  String _college,_major,_birthday,_numcard,_homeloc,_class;

  TextEditingController _majorcon = new TextEditingController();
  TextEditingController _stupw = new TextEditingController();
  TextEditingController _stuhome = new TextEditingController();
  TextEditingController _stucard = new TextEditingController();
  TextEditingController _stubirth = new TextEditingController();
  TextEditingController _stuclass = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
//    _college = _student != null ? _student.college : "未知";
//    _major = _student != null ? _student.student_major:"未知";
//    _class = _student != null ? _student.student_class :"未知";
//    _homeloc = _student != null ? _student.student_home :"未知";
//    _birthday = _student != null ? _student.brithday : "未知";
//    _numcard = _student != null ? _student.identity_card :"未知";
    Widget bodywidget;
    if(_student == null ){
      bodywidget = new Center(
        child: CircularProgressIndicator(),
      );
    }else{
      bodywidget = new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Text("注：敏感信息可以不用填写！",style: TextStyle(color: Colors.red),),
          Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.class_),
                    Expanded(child: Text(_college)),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down,color: Colors.grey,),
                      onPressed: (){
                        print('选择学院');
//                        _sampleDialog(context);
                        showDialog(
                            context: context,
                            builder: (context){
                              return SimpleDialog(
                                title: Text('选择学院'),
                                children: <Widget>[
                                  SimpleDialogOption(
                                    child: Text("外国语学院"),
                                    onPressed: (){
                                      setState(() {
                                        _college = "外国语学院";
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SimpleDialogOption(
                                    child: Text("计算机与控制工程学院"),
                                    onPressed: (){
                                      setState(() {
                                        _college = "计算机与控制工程学院";
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            }
                        );
                      },
                    ),
                  ],
                ),

                TextFormField(
                  controller: _majorcon,
                  decoration: InputDecoration(
                    labelText: "专业",
                    hintText: _major,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  controller: _stuclass,
                  decoration: InputDecoration(
                    labelText: "班级",
                    hintText: _class,
                    prefixIcon: Icon(Icons.class_),
                  ),
                ),
                TextFormField(
                  controller: _stuhome,
                  decoration: InputDecoration(
                    labelText: "家乡",
                    hintText: _homeloc,
                    prefixIcon: Icon(Icons.class_),
                  ),
                ),
                TextFormField(
                  controller: _stubirth,
                  decoration: InputDecoration(
                    labelText: "出生日期",
                    hintText: _birthday,
                    prefixIcon: Icon(Icons.class_),
                  ),
                ),
                TextFormField(
                  controller: _stucard,
                  decoration: InputDecoration(
                    labelText: "身份证号",
                    hintText: _numcard,
                    prefixIcon: Icon(Icons.class_),
                  ),
                ),
                TextFormField(
                  controller: _stupw,
                  decoration: InputDecoration(
                    labelText: "修改密码",
                    hintText: "*********",
                    prefixIcon: Icon(Icons.class_),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: RaisedButton(
                      child: Text('提交'),
                      onPressed: (){
                        if((_formKey.currentState as FormState).validate()){
                          //提交修改信息
                          Student stu = new Student();
                          stu.objectId = _OBJECTID;
                          if(_stupw.text.length > 0){
                            stu.student_pw = _stupw.text;
                          }
                          if(_stucard.text.length >0){
                            stu.identity_card = _stucard.text;
                          }
                          if(_stubirth.text.length >0){
                            stu.brithday = _stubirth.text;
                          }
                          if(_stuhome.text.length >0){
                            stu.student_home = _stuhome.text;
                          }
                          if(_stuclass.text.length >0){
                            stu.student_class = _stuclass.text;
                          }
                          if(_majorcon.text.length >0){
                            stu.student_major = _majorcon.text;
                          }
                          stu.college = _college;

                          stu.update().then((BmobUpdated bmobUpdated){
                            showSuccess(context, "修改一条数据成功：${bmobUpdated.updatedAt}");
                          }).catchError((e){
                            showError(context, "请先新增一条数据");
                          });

                        }
                      },
                    )
                )
              ],
            ),
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('更新个人信息'),
      ),
      body: bodywidget,
    );
  }

  @override
  void initState() {
    //TODO:前一个页面传过来学号

    String studentID = _xuehao;
    BmobQuery query = new BmobQuery();
    bool flag = true;
    query.queryObjectsByTableName('Student').then((data){
      List<Student> stus = data.map((i) => Student.fromJson(i)).toList();
      for(int i = 0;i<stus.length;i++){
        if(stus[i].student_id == studentID){
            _student = stus[i];
            flag = false;
            break;
        }
      }
      if(!flag){
        setState(() {
          _college = _student != null ? _student.college : "未知";
          _major = _student != null ? _student.student_major:"未知";
          _class = _student != null ? _student.student_class :"未知";
          _homeloc = _student != null ? _student.student_home :"未知";
          _birthday = _student != null ? _student.brithday : "未知";
          _numcard = _student != null ? _student.identity_card :"未知";
          //保存objectId
          _OBJECTID = _student.objectId;
        });
      }
    }).catchError((e){
      showError(context, BmobError.convert(e).error);
    });
    
    super.initState();
  }


}