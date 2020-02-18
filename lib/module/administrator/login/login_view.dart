
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/administrator_info.dart';
import 'package:fight_ncp_qqhru/models/student.dart';
import 'package:fight_ncp_qqhru/module/administrator/homepage/administrator_homepage.dart';
import 'package:fight_ncp_qqhru/module/doorkeeper/DoorKeeper.dart';
import 'package:fight_ncp_qqhru/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';

import 'login_presenter.dart';

class Administrator_LoginView extends StatefulWidget{
  final String title;
  Administrator_LoginView({Key key,this.title}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _Administrator_LoginViewState(title);
  }

}

class _Administrator_LoginViewState extends State<Administrator_LoginView> implements AdministratorViewContract{
  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _username = '';//登陆帐号
  var _isShowClear = false;//是否显示输入框尾部的清除按钮
  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  AdministratorPresenter _administratorPresenter;
  Administrator_info _administrator_info;

  String _img = '';

  String _name ='';
  String _title = '';

  String _A ='';//管理员姓名
  String _B = '';//管理员级别
  String _C='';//管理员部门
  _Administrator_LoginViewState(String title){
    if(title == 'A'){
      _title = title;
      _img =                                 "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581907370215&di=1dfcc20d7118ecf3bee37c4062b9eb6d&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D3897107930%2C3785938129%26fm%3D214%26gp%3D0.jpg";
      _name = '校级管理员登陆';
    }
    else if(title == 'B'){
      _title = title;
      _img = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581907378006&di=e4627a0b71f25e2299957ab018256f9a&imgtype=0&src=http%3A%2F%2Fimg.qqzhi.com%2Fuploads%2F2018-12-06%2F150903289.jpg';
    _name = '院级管理员登陆';
    }else if( title == 'C'){
      _title = title;
      _img = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581908628476&di=eacc61a87124efc1936108c92b08c379&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F18%2F03%2F26%2F3659bf8ac5efd1d78705ba60b48babe8.jpg%2521%2Ffwfh%2F804x963%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue';
      _name = '门卫人员登陆';
    }

  }
  @override
  void initState() {
    _focusNodeUserName.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener((){
      //监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if(_userNameController.text.length > 0){
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {

      });
    });
    _administratorPresenter = new AdministratorPresenter(this);
    super.initState();
  }


  @override
  void dispose() {
    //移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }
  //监听焦点
  Future<Null> _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      print('用户名框获取焦点');
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
          _img,
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
                  labelText: "管理人员登陆",
                  hintText: "请输入帐号",
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
                onSaved: (String value){
                  _username = value;
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
          _focusNodeUserName.unfocus();
          if(_formKey.currentState.validate()){
            //只有通过验证，才会执行这里
            _formKey.currentState.save();
            //TODO:登陆操作
            print('$_username');
            _login(context);
          }
        },
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_name),
      ),
      body: GestureDetector(
        onTap: (){
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

  ///用户名登录
  _login(BuildContext context) {
    bool flag = false;
    BmobQuery query = new BmobQuery();
    query.queryObjectsByTableName("administrator_info").then((data) {
        List<Administrator_info> administratorS = data.map((i) => Administrator_info.fromJson(i)).toList();
       for(int i = 0; i<administratorS.length;i++){
         if(_username == administratorS[i].administrator_id){
           flag = true;
           _administrator_info = administratorS[i];
           break;
         }
       }
       print('=============================================================================================');
       if(flag){
         _A = _administrator_info.administrator_name;
         _B = _administrator_info.administrator_level;
         _C = _administrator_info.administrator_branch;
         _administratorPresenter.loginprepare(_administrator_info);

       }else{
         print('查无此人');
         showError(context, '不存在该管理员帐号');
       }
    }).catchError((e) {
      showError(context, BmobError.convert(e).error);
    });
  }

  //管理员登陆成功
  @override
  void onAdministratorLoginComplete() {
    // TODO: 进入管理员主页面
    print('登陆成功');

    if(_title == 'A'){
      Navigator.push<String>(context, new MaterialPageRoute(builder: (context){
        return new AdministratorHomePage(initator: _username,A: _A,B: _B,C: _C,);
      }));
//      Navigator.pushNamed(context, Constant.administrator_homepage);
    }else if(_title =='B'){
      Navigator.push<String>(context, new MaterialPageRoute(builder: (context){
        return new AdministratorHomePage(initator: _username,A: _A,B: _B,C: _C,);
      }));
//      Navigator.pushNamed(context, Constant.administrator_homepage);
    }else if(_title == 'C'){
      Navigator.push<String>(context, new MaterialPageRoute(builder: (context){
        return new Doorkeeper(initator: _username,);
      }));
//      Navigator.pushNamed(context, Constant.doorkeeper_page);
    }




  }

  //管理员登陆失败
  @override
  void onAdministratorLoginError() {
    print('登陆失败');
  }

}