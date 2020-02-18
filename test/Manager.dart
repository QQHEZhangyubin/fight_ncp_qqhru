class Manager{
  List<String> list =[];
  Map<num,String> maplist = new Map();
  factory Manager() =>_getInstance();
   static Manager get instance => _getInstance();
  static Manager _instance;
  Manager._internal(){
  }

  static Manager _getInstance() {
    if(_instance == null){
      _instance = new Manager._internal();
    }
    return _instance;
  }

}
