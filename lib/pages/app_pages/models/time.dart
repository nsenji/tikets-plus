import 'package:flutter/foundation.dart';
class Datetime extends ChangeNotifier{
  String date = '';
  String time ='';

  List dateList = [];
  List timeList = [];

  void dateNow(item){
    date = item;
    notifyListeners();
  }

  void timeNow(item){
    time = item;
    notifyListeners();
  }
   dynamic get date_list => dateList[0];
   dynamic get time_list => timeList[0];
}

