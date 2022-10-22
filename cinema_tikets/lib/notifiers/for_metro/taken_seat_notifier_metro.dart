import 'dart:collection';

import 'package:cinema_tikets/models/seatNumbers_from_firestore/for_acacia/get_seatList_model.dart';
import 'package:cinema_tikets/models/seatNumbers_from_firestore/for_metro/seatNumber_metro.dart';
import 'package:flutter/cupertino.dart';

class TakenSeat_metro extends ChangeNotifier{
  List<SeatNumber_metro> _seatList= [];


UnmodifiableListView<SeatNumber_metro> get seatList => UnmodifiableListView(_seatList);

set seatList(List<SeatNumber_metro> seatList) {
    _seatList = seatList;
    notifyListeners();
  }



}