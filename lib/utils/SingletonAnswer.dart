

class SingletonAnswer{
   Map<num,String> maplist = new Map();
   //num _question_id;
   //String _option1,_option2,_option3,_option4,_option5,_option6;
   factory SingletonAnswer() => _getInstance();
   static SingletonAnswer get instance => _getInstance();
   SingletonAnswer._internal(){

   }
   static SingletonAnswer _instance ;
   static SingletonAnswer _getInstance(){
      if(_instance == null) {
         _instance = new SingletonAnswer._internal();
      }
      return _instance;
   }






}