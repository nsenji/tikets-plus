import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../../models/seatNumbers_from_firestore/for_acacia/get_seatList_model.dart';

class SeatNumberModel_metro extends ChangeNotifier {
  List items = [];
  int sumOfprice = 0;
  int vip = 15000;
  int ordinary = 10000;
  

  

  

  void add(item) {
    items.add(item);
    notifyListeners();
  }

  void remove(item) {
    items.remove(item);
    notifyListeners();
  }

  dynamic get seatNumber {
    return items;
  }

  dynamic addPrice(item) {
    if (item < 22 && item > 0) {
      sumOfprice += vip;
      notifyListeners();
    }
    if (item > 21) {
      sumOfprice += ordinary;
      notifyListeners();
    }
  }

  dynamic reducePrice(item) {
    if (item < 22 && item > 0) {
      sumOfprice -= vip;
      notifyListeners();
    }
    if (item > 21) {
      sumOfprice -= ordinary;
      notifyListeners();
    }
  }

  dynamic get totalPrice {
    return sumOfprice;
  }
}
