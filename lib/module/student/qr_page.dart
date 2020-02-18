import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr_page extends StatefulWidget{
  final String title;
  Qr_page({Key key,this.title}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Qr_pageState(title);
  }

}

class _Qr_pageState extends State<Qr_page> with AutomaticKeepAliveClientMixin{
  String _xuehao;
  _Qr_pageState(String title){
    _xuehao = title;
    print(_xuehao  + "kkkkkkkkkkkkkkkkk");
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息码'),
      ),
      body: Center(
        child: QrImage(
            data: _xuehao,
            size: 200.0,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}