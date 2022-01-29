import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier{

   String taskName = 'My data';

  bool isDone;

  bool toggleDone() {
    isDone = !isDone;
    return isDone;
  }

  TaskData({this.taskName,this.isDone});

   //String data = 'My data';

   void changeString(String newString){
     taskName= newString;
     notifyListeners();
   }

  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return super.toString();
  // }
}
