

import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/generated/i18n.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/models/student.dart';
import 'package:fight_ncp_qqhru/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_LoginView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return _Student_LoginViewState();
  }

}

class _Student_LoginViewState extends State<Student_LoginView> {

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = '';//用户名
  var _username = '';//密码
  var _isShowPwd = false;//是否显示密码
  var _isShowClear = false;

  @override
  void initState() {
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener((){
      print(_userNameController.text);
      //监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if(_userNameController.text.length > 0){
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    //移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  } //是否显示输入框尾部的清除按钮
  //监听焦点
    Future<Null> _focusNodeListener() async{
      if(_focusNodeUserName.hasFocus){
        print('用户名框获取焦点');
        _focusNodePassWord.unfocus();
      }
      if(_focusNodePassWord.hasFocus){
        print('密码框获取焦点');
        _focusNodeUserName.unfocus();
      }
    }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    //logo 图片区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      //设置图片为圆形
      child: ClipOval(
        child: Image.network(
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581908481541&di=e603b02b80c48f0a49935021e83ebf26&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F655ba5b31bc6243428a306b10a7f895b36d3d3d35a1e-5phgk4_fw658',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );

    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _userNameController,
                focusNode: _focusNodeUserName,
                //设置键盘类型
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入学号",
                  prefixIcon: Icon(Icons.person),
                  //尾部添加清楚按钮
                  suffixIcon: (_isShowClear) ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: (){
                      //清楚输入框内容
                      _userNameController.clear();
                    },
                  )
                      : null,
                ),
                  validator: (v){
                    return ( v.length == 0 || v ==null) ? '学号不能为空':null;
                   },
//                validator: validateUserName,
                onSaved: (String value){
                  _username = value;
                },
              ),
              TextFormField(
                focusNode: _focusNodePassWord,
                decoration: InputDecoration(
                    labelText: "密码默认为学号",
                    hintText: "请输入密码",
                    prefixIcon: Icon(Icons.lock),
                    //是否显示密码
                    suffixIcon: IconButton(
                      icon: Icon((_isShowPwd) ? Icons.visibility:Icons.visibility_off),
                      //点击改变显示或隐藏按钮
                      onPressed: (){
                        setState(() {
                          _isShowPwd = !_isShowPwd;
                        });
                      },
                    )
                ),
                validator: (v){
                  return (v.length ==0 || v ==null) ? '密码不能为空':null;
                },
                obscureText: !_isShowPwd,
                //密码验证
//                validator: validatePassWord,
                //保存数据
                onSaved: (String value){
                  _password = value;
                },
              ),
            ],
          )),
    );



    //登陆按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: RaisedButton(
        color: Colors.blue[300],
        child: Text(
          "登陆",
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        //设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

        onPressed: (){
          //点击登陆按钮，解除焦点，回收键盘
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
          if(_formKey.currentState.validate()){
            //只有通过验证，才会执行这里
            _formKey.currentState.save();
            if(_username != _password){
              showError(context, "帐号与密码不匹配");
            }else{
              BmobQuery query = new BmobQuery();
              query.queryObjectsByTableName('Student').then((value){
                List<Student> students = value.map((f) => Student.fromJson(f)).toList();
                bool flag = true;
                for(int i= 0;i<students.length;i++){
                  if(students[i].student_id == _username && students[i].student_pw == _password){
                    flag = false;
//                    print(students[i].student_major);
                    String objectid = students[i].getObjectId();
//                    print(objectid);
//                    print('---------------------------------------');
                    saveObjectid(objectid,_username);
                    break;
                  }
                }
                if(flag){
                  //没有此用户
                  Student student = new Student();
                  student.student_id = _username;
                  student.student_pw = _password;
                  student.college = Constant.SchooleName;
                  student.student_class = Constant.Default_indo;
                  student.student_level = Constant.Default_indo;
                  student.student_major = Constant.Default_indo;
                  student.brithday = Constant.Default_indo;
                  student.student_avar = Constant.Default_indo;
                  student.identity_card = Constant.Default_indo;
                  student.student_home = Constant.Default_indo;
                  student.save().then((BmobSaved bmobsaved){
                    String objectid = bmobsaved.objectId;

                    saveObjectid(objectid,_username);
                    //进入别的页面
                    Navigator.pushReplacementNamed(context, Constant.student_home_page);
                  }).catchError((e){
                    showError(context,BmobError.convert(e).error);
                  });
                }else{
                  //进入别的页面
                  Navigator.pushReplacementNamed(context, Constant.student_home_page);
                }
              }).catchError((e){
                showError(context,BmobError.convert(e).error);
              });
            }
          }
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('学生登陆'),
      ),
      body:GestureDetector(
        onTap: (){
          print('点击了空白区域');
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
        },
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),
            logoImageArea,
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            inputTextArea,
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            loginButtonArea,
          ],
        ),
      ),
    );
  }

  void saveObjectid(String objectid, String username) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Constant.studenId, username);
    preferences.setString(Constant.stuobjectid,objectid);


  }

}