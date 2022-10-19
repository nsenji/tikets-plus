import 'package:flutter/foundation.dart';
class MovieTitle extends ChangeNotifier{
  String title = '';

  List chosen = [];

  void theChoice(item){
    title = item;
    notifyListeners();
  }
  dynamic get branch => chosen[0];
}

class MovieImage extends ChangeNotifier{
  String image = '';

  List chosen = [];

  void theChoice(item){
    image = item;
    notifyListeners();
  }
  dynamic get branch => chosen[0];
}