import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:fight_ncp_qqhru/module/administrator/designproblem/DesignProblem.dart';
import 'package:flutter/material.dart';

class SinglePage extends StatefulWidget{
  final num survey_id;
  final String problemtype;
  SinglePage({Key key,this.survey_id,this.problemtype}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SinglePageSate(survey_id,problemtype);
  }

}

class _SinglePageSate extends State<SinglePage> {

  String _title= '';
  List<String> _li = ['A','B','C'];
  List<String> _list=[];

  GlobalKey<FormState> _state = new GlobalKey();
  num _surveyId;
  String _problemtype;
  _SinglePageSate(num survey_id, String problemtype){
    _surveyId = survey_id;
    _problemtype = problemtype;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(_problemtype + '设置'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('标题'),
          ),
//          Text('输入内容....'),
          TextFormField(
            autofocus: true,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: '请输入题目内容',
            ),
            autovalidate: true,
            validator: (v){
              return v.length == 0? '标题不能未空':null;
            },
            onChanged: (v){
              _title = v;
            },
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('选项:'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Form(
              key: _state,
              child: ListView.builder(
                  itemBuilder: (context,index){
                    return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.cancel,color: Colors.red,),
                                onPressed: (){
                                    setState(() {
                                      _li.removeAt(index);
                                    });
                                },
                            ),
//                          Text('option +$index'),
                            Expanded(
                              child: TextFormField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintMaxLines: 1,
                                  hintText: '输入选项'
                                ),
                                onSaved: (value){
                                  print(value);
                                  _list.add(value);
                                },
                                validator: (v){
                                  return (ideshfa(_list)) ? '选项内容不能一样':null;
                                },
                              ),
                            ),
                          ],
                        ),
                    );
                  },
//                itemExtent: 80,
                  itemCount: _li.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
              ),
            ),
          ),
          (_li.length < 6) ?RaisedButton(
              child: Text('添加选项'),
              onPressed: (){
                setState(() {
                  _li.add('E');
                  print(_li.length);
//                  _title = '!!!SAAFERSA';
                });
              }) : Text(' ') ,
          RaisedButton(
              child: Text('保存'),
              onPressed: (){
                    if(_list.length == 0){
                      _state.currentState.save();
                    }else{
                      _list.clear();
                      _state.currentState.save();
                    }

                  if(_state.currentState.validate()){
                    //内容合法，标题_title,选项_list<String>
                    //TODO:ref_survey_id 参数从上一个页面传过来,question_id属于自赠属性
                    Survey_content survey_content = new Survey_content();
                    survey_content.ref_survey_id = _surveyId;
                    survey_content.problem_content = _title;
                    survey_content.problem_type = _problemtype;
                    for(int i = 0;i<_list.length ;i++){
                      if( i== 0) survey_content.option1 = _list[0];
                      if( i== 1) survey_content.option2 = _list[1];
                      if( i== 2) survey_content.option3 = _list[2];
                      if( i== 3) survey_content.option4 = _list[3];
                      if( i== 4) survey_content.option5 = _list[4];
                      if( i== 5) survey_content.option6 = _list[5];
                    }
                    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context){
                          return DesignProblemPage(survey_content: survey_content,objectid: null,);
                    }));
                  }
              },
          ),
        ],
      ),
    );
  }

  bool ideshfa(List<String> list) {
    List<String> l = [];
    for(int i=0;i<list.length;i++){
      if(l.contains(list[i])){
        return true;
      }
      l.add(list[i]);
    }
    return false;
  }
}