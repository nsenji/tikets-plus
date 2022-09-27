

import 'package:flutter/foundation.dart';

class SeatNumberModel extends ChangeNotifier {
   List _items = [];
  var number;


  void add( item) {
    _items.add(item);
    notifyListeners();
  }

  void remove() {
    _items.clear();
    notifyListeners();
  }

  dynamic get seatNumber {
    if (_items.length == 0) {
      return "choose";
    } else {
      return _items[0];
    }
  }
}



