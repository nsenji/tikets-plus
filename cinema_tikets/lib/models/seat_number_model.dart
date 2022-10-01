import 'package:flutter/foundation.dart';

class SeatNumberModel extends ChangeNotifier {
  List items = [];
  int sumOfprice = 0;
  int vip = 10000;
  int ordinary = 4000;

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
























