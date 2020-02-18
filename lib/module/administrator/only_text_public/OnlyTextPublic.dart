
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:flutter/material.dart';

class OnlyTextPublic extends StatefulWidget{
  final String initatorid;
  OnlyTextPublic({Key key,this.initatorid}):super(key :key);
  @override
  State<StatefulWidget> createState() {
    return _OnlyTextPublicState(initatorid);
  }

}

class _OnlyTextPublicState extends State<OnlyTextPublic> {

  var _publicTitle ='';//标题
  var _publicDescription = '';//具体描述
  GlobalKey _formKey= new GlobalKey<FormState>();
  String _initatorid = '';
  _OnlyTextPublicState(String initatorid){
    _initatorid = initatorid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布公告'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: <Widget>[
                  Text('公告标题'),
                  TextFormField(
                    maxLines: 3,
                    validator: (v){
                      return ( v.length == 0 || v ==null) ? '标题不能为空':null;
                    },
                    onChanged: (value){
                      _publicTitle = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: '请输入名称',
                    ),
                    onSaved: (value) {
                      _publicDescription = value;
                    },

                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text('公告内容'),
                  ),
                  TextFormField(
                    maxLines: 7,

                    validator: (v){
                      return ( v.length == 0 || v ==null) ? '内容不能为空':null;
                    },
                    keyboardType: TextInputType.text,
//                validator: null,
                    decoration: InputDecoration(
                      hintText: '请输入内容',
                    ),
                    onChanged: (value){
                      _publicDescription = value;
                    },
                    onSaved: (value) {
                      _publicDescription = value;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 10.0),
                    height: 45.0,
                    child: Center(
                      child: RaisedButton(
                        color: Colors.blue[300],
                        child: Text(
                          "发布公告",
                          style: Theme.of(context).primaryTextTheme.headline,
                        ),
                        //设置按钮圆角
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

                        onPressed: (){
                          //点击按钮，解除焦点，回收键盘
                          if((_formKey.currentState as FormState).validate()){
                            print(_publicTitle);
                            print(_publicDescription);

                            Survey survey = new Survey();
                            survey.survey_type = '文本';
                            survey.survey_title = _publicTitle;
                            survey.survey_description = _publicDescription;
                            survey.survey_state = '进行中';
                            survey.survey_initiator = _initatorid;

//

                            survey.access_obj = '齐齐哈尔大学';

                            survey.save().then((BmobSaved bmobsaved){
                              showSuccess(context, '发布成功');
                            }).catchError((e){
                              showError(context, BmobError.convert(e).error);
                            });










                          }

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  //监听焦点


}