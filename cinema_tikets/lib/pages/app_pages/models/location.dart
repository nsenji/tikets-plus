import 'package:flutter/foundation.dart';

class Place extends ChangeNotifier {
  String location = '';
  dynamic _currentPlace = '';

  List locationChoice = [];

  void theChoice(item) {
    location = item;
    notifyListeners();
  }

  dynamic get branch => locationChoice[0];

  get currentPlace => _currentPlace;

  set currrentPlace(place) {
    _currentPlace = place;
    notifyListeners();
  }
}
