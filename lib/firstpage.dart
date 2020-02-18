
import 'package:fight_ncp_qqhru/module/administrator/login/login_view.dart';
import 'package:fight_ncp_qqhru/utils/Constants.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('齐齐哈尔大学人员管理系统')),
      ),
      body:
      new Center(
        child:
        new Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            mainAxisSize: MainAxisSize.max,
//            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:50.0,left: 40.0,),
                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  mainAxisSize: MainAxisSize.max,
//                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        mainAxisSize: MainAxisSize.max,
//                        crossAxisAlignment: CrossAxisAlignment.center
                          children: <Widget>[
                            GestureDetector(
                              child: new Image.network(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581907370215&di=1dfcc20d7118ecf3bee37c4062b9eb6d&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D3897107930%2C3785938129%26fm%3D214%26gp%3D0.jpg",
                                width: 130,
                                height: 130,
                                fit:BoxFit.fill,
                              ),
                              onTap: (){
//                                print('校级管理员入口');
//                                Navigator.pushNamed(context, Constant.administrator_Login_page);
                                Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                                  return new Administrator_LoginView(title: 'A');
                                }));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: new Text(
                                "校级管理员入口",
                                style: new TextStyle(fontSize:12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                            )
                          ]
                      ),
                      Text('      '),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: new Image.network(
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581907378006&di=e4627a0b71f25e2299957ab018256f9a&imgtype=0&src=http%3A%2F%2Fimg.qqzhi.com%2Fuploads%2F2018-12-06%2F150903289.jpg',
                              width: 130,
                              height: 130,
                              fit:BoxFit.fill,
                            ),
                            onTap: (){
//                              Navigator.pushNamed(context, Constant.administrator_Login_page);
                              Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                                return new Administrator_LoginView(title: 'B');
                              }));
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: new Text(
                              "学院管理员入口",
                              style: new TextStyle(fontSize:12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ),
                          )
                        ],
                      )
                    ]

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 40.0,),
                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  mainAxisSize: MainAxisSize.max,
//                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        mainAxisSize: MainAxisSize.max,
//                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: new Image.network(
                                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581908628476&di=eacc61a87124efc1936108c92b08c379&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F18%2F03%2F26%2F3659bf8ac5efd1d78705ba60b48babe8.jpg%2521%2Ffwfh%2F804x963%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue',
                                width: 130,
                                height: 130,
                                fit:BoxFit.fill,
                              ),
                              onTap: (){
//                                Navigator.pushNamed(context, Constant.administrator_Login_page);
                                Navigator.push<String>(context, new MaterialPageRoute(builder: (BuildContext context){
                                  return new Administrator_LoginView(title: 'C');
                                }));
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: new Text(
                                "门卫人员入口",
                                style: new TextStyle(fontSize:12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                            )
                          ]
                      ),
                      Text('      '),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: new Image.network(
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581908481541&di=e603b02b80c48f0a49935021e83ebf26&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F655ba5b31bc6243428a306b10a7f895b36d3d3d35a1e-5phgk4_fw658',
                              width: 130,
                              height: 130,
                              fit:BoxFit.fill,
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, Constant.student_login_page);
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: new Text(
                              "学生人员入口",
                              style: new TextStyle(fontSize:12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ),
                          )
                        ],
                      )
                    ]

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 40.0,),
                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  mainAxisSize: MainAxisSize.max,
//                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        mainAxisSize: MainAxisSize.max,
//                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: new Image.network(
                                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581908628476&di=bdeb389cad45f45fab2de3de33b2716c&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Felement_origin_min_pic%2F18%2F07%2F23%2F61919e9a7f782fa67cdbdc3d519ff6fb.jpg',
                                width: 130,
                                height: 130,
                                fit:BoxFit.fill,
                              ),
                              onTap: (){
                                    Navigator.pushNamed(context, Constant.outpeople_page);
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: new Text(
                                "外来人员",
                                style: new TextStyle(fontSize:12.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                            )
                          ]
                      ),
                      Text('      '),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Image.network(
                            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581908893827&di=2415421a9528bd35efc9b60a4c3c91a2&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F01%2F37%2F90%2F37573c67da5e0bd.jpg',
                            width: 130,
                            height: 130,
                            fit:BoxFit.fill,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: new Text(
                              "暂未开放",
                              style: new TextStyle(fontSize:12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ),
                          )
                        ],
                      )
                    ]

                ),
              ),
            ]
        ),

      ),

    );
  }
}