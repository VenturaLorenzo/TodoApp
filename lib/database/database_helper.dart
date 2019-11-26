import 'dart:math';

import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app/activity.dart';


class DatabaseHelper {
  List<Activity> _activities=[Activity("prova 1")];
  DatabaseHelper._constructor();

  static final DatabaseHelper db = DatabaseHelper._constructor();

  newActivity() async{


    
    Activity newAct= new Activity("prova ");
    assignID(newAct);
    newAct.name +=newAct.getID().toString();
    _activities.add(newAct);
 
  }
  Activity assignID(Activity act){

 int id = Random.secure().nextInt(100);

    while(checkID(id)==false){
       id = Random.secure().nextInt(100);
    }
    act.setID(id);
    return act;
  }
  checkID(int id){
 for (var i = 0; i < _activities.length; i++) {
       if (_activities[i].getID() == id) {
            return false;
          }
          return true;
    }
  }
delete(int id){
  int toDelete=-1;
for (var i = 0; i < _activities.length; i++) {
       if (_activities[i].getID() == id) {
            toDelete=i;
          }
      
    }
    if(toDelete==-1){
      print("ID non trovato mentre cercavo di cancellare, riprova");
      return;
    }
    _activities.removeAt(toDelete);

}
  getActivities() async {
    return _activities;
  }

  void insertActivity(Activity activity) {
assignID(activity);
_activities.add(activity);

  }

  queryAllLog() {}

  void deleteAll() {}

  queryAllRows() {}

  void saveToLog() {}
}
