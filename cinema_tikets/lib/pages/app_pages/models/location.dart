import 'package:flutter/foundation.dart';
class Place extends ChangeNotifier{
  String location = '';

  List locationChoice = [];

  void theChoice(item){
    location = item;
    notifyListeners();
  }
  dynamic get branch => locationChoice[0];
}