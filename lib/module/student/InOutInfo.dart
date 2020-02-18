
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:flutter/material.dart';

class InAndOutPage extends StatefulWidget{
  final String title;
  InAndOutPage({Key key,this.title}) :super(key : key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InAndOutPageSate(title);
  }

}

class _InAndOutPageSate extends State<InAndOutPage> {
  String _xuehao ="";
  _InAndOutPageSate(String title){
    _xuehao = title;
  }
  List<Out_student> _list = [];

  @override
  Widget build(BuildContext context) {
    Widget bodywidget;
    if(_list == null || _list.length == 0){
      bodywidget = new Center(
        child: Text('暂无数据'),
      );
    }else{
      bodywidget = new Container(
        child: ListView.separated(
            itemBuilder: (context,index){
              return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: <Widget>[
                      Text('出入时间：'),
                      Text(_list[index].createdAt),
                    ],
                  ),
              );
            },
            separatorBuilder: (context,index){
              return Divider(color: Colors.grey,);
            },
            itemCount: _list.length,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('个人出入信息'),
      ),
      body: bodywidget,
    );
  }

  @override
  void initState() {
    BmobQuery query = new BmobQuery();
    query.queryObjectsByTableName('Out_student').then((data){
      List<Out_student> out_stus = data.map((i) => Out_student.fromJson(i)).toList();
      for(int i = 0;i<out_stus.length;i++){
        if(out_stus[i].ref_student_id == _xuehao){
          _list.add(out_stus[i]);
        }
      }
      setState(() {
//       _list = out_stus;
      });
    }).catchError((e){
      showError(context, BmobError.convert(e).error);
    });

  }
}