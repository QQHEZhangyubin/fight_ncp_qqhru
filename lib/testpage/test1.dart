import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:flutter/material.dart';

class Test1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Test1State();
  }

}

class _Test1State extends State<Test1> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }

  @override
  void initState() {
    BmobQuery bmob = new BmobQuery();
    bmob.queryObjectsByTableName('survey_answer').then((data){
      print(data.toString());
    });

  }
}