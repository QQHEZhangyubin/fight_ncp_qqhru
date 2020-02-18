import 'package:fight_ncp_qqhru/data/RandomUserRespository.dart';
import 'package:fight_ncp_qqhru/module/administrator/homepage/administraror_HomePage_Repository.dart';
import 'package:fight_ncp_qqhru/module/administrator/homepage/administraror_HomePage_Repository_Impl.dart';
import 'package:fight_ncp_qqhru/module/administrator/login/administrator_login_repository.dart';
import 'package:fight_ncp_qqhru/module/administrator/login/administrator_login_repository_Impl.dart';

import '../data/contact_data.dart';
import '../data/contact_data_mock.dart';


enum Flavor {MOCK,PRO}

class Injector{
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void config(Flavor flavor){
    _flavor = flavor;
  }
  //命名构造函数----实现一个类可以有多个构造函数，提供更有针对性的构造函数
  Injector._internal();

  //工厂构造函数，创建时先查看缓存中是否有类的案例，有则返回，没有则创建
  factory Injector(){
    return _singleton;
  }

  ContactRepository get contactRepository{
    switch(_flavor){
      case Flavor.MOCK:
        return new MockContactRepository();
      case Flavor.PRO:
        return new RandomUserRepository();
      default:
        return new MockContactRepository();
    }
  }

  Administrator_Login_Repository get administartor_login_repository{
    return new Administrator_Login_Repository_Impl();
  }

  Administraror_HomePage_Repository get administraror_HomePage_Repository{
    return new Administraror_HomePage_Repository_Impl();
  }

}