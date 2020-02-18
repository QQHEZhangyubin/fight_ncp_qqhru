
import 'package:fight_ncp_qqhru/injection/dependency_injection.dart';
import 'package:fight_ncp_qqhru/models/index.dart';

import 'administraror_HomePage_Repository.dart';

abstract class Administrator_HomePageView{
  void loadSurveytableInfo_Success(List<Survey> surveylist);
  void loadSurveytableInfo_Fail();
}
class AdministratorPresenter{
  Administrator_HomePageView _view;
  Administraror_HomePage_Repository administraror_homePage_Repository;

  AdministratorPresenter(Administrator_HomePageView administrator_homePageView){
    _view = administrator_homePageView;
    administraror_homePage_Repository = Injector().administraror_HomePage_Repository;
  }
  void pulltableInfo(){
    assert(_view != null);
    _view.loadSurveytableInfo_Success(administraror_homePage_Repository.onLoadSurveytablesInfo());
  }
}