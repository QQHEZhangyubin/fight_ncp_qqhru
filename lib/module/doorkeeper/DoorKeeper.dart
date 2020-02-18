

import 'package:barcode_scan/barcode_scan.dart';
import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:fight_ncp_qqhru/models/index.dart';
import 'package:vibrate/vibrate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Doorkeeper extends StatefulWidget{

  final String initator;
  Doorkeeper({Key key,this.initator}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DoorkeeperState(initator);
  }

}

class _DoorkeeperState extends State<Doorkeeper> {
  String _initator = '';
  _DoorkeeperState(String initator){
    _initator = initator;
  }


  Future scan(BuildContext context) async{

    try{
      String barcode = await BarcodeScanner.scan();
      print('扫码结果: '+barcode);
      BmobQuery query = new BmobQuery();
      bool canVibrate = await Vibrate.canVibrate;
      if(canVibrate){
        Vibrate.vibrate();
      }
      query.queryObjectsByTableName('Student').then((data) {
        bool flag = false;
        List<Student> stus = data.map((i) => Student.fromJson(i)).toList();
        for(int i = 0;i<stus.length;i++){
          if(barcode == stus[i].student_id){
            flag = true;
            break;
          }
        }
        if(flag){
            Out_student out_student = new Out_student();
            out_student.ref_student_id = barcode;
            out_student.ref_administrator_id = _initator;
            out_student.out_date = TimeOfDay.now().toString();
            out_student.save().then((BmobSaved bmobSaved){

                showSuccess(context, '出入信息已保存');
            }).catchError((e) {
              showError(context, BmobError.convert(e).error);
            });
        }else{
            showError(context, '在学生信息库中没有找到此人');
        }
      });
    }on PlatformException catch(e) {
      if(e.code == BarcodeScanner.CameraAccessDenied){
        print('未授予APP相机权限');
        showError(context, '没有打开相机权限，请前往手机设置中给予照相权限');
      }else{
        // 扫码错误
        print('扫码错误: $e');
        showError(context, '没有打开相机权限，请前往手机设置中给予照相权限');
      }
    } on FormatException{
      print('进入扫码页面后未扫码就返回');
    }catch(e){
      // 扫码错误
      print('扫码错误: $e');
      showError(context, '扫码错误');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('门卫处'),
      ),
      body:Center(
        child:GestureDetector(
          onTap: (){
            scan(context);
          },
          child: Image.asset(
              'imgs/scan.png',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
          ),
        ),
        )
      );
  }
  @override
  void initState() {
    super.initState();
  }
}