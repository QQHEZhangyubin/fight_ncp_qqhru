import 'package:fight_ncp_qqhru/injection/dependency_injection.dart';
import 'package:fight_ncp_qqhru/models/administrator_info.dart';

import 'administrator_login_repository.dart';

abstract class AdministratorViewContract{
  void onAdministratorLoginComplete();

  void onAdministratorLoginError();
}
class AdministratorPresenter{
  AdministratorViewContract _view;
  Administrator_Login_Repository _repository;

  AdministratorPresenter(AdministratorViewContract _AdministratorState){
    _view = _AdministratorState;
    _repository = Injector().administartor_login_repository;
  }
//  ContactListPresenter(this._view){
//    _repository = Injector().contactRepository;
//  }
//  ContactListPresenter(this._view){
//    _repository = Injector().contactRepository;
//  }
  void loginprepare(Administrator_info administrator_info){
    assert(_view != null);

    _repository
        .login(administrator_info)
        .then((contacts) => _view.onAdministratorLoginComplete())
        .catchError((onError) => _view.onAdministratorLoginError());
  }
}