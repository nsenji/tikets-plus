import 'package:flutter/foundation.dart';

class SeatNumberModel {
  List items = [];

  void add(item) {
    items.add(item);
  }

  void remove(item) {
    items.remove(item);
  }

  dynamic get seatNumber {
    return items;
  }
}
