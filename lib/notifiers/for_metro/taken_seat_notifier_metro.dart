import 'dart:collection';

import 'package:cinema_tikets/models/model_List_of_taken_seats_for_acacia/metro_list.dart';
import 'package:flutter/cupertino.dart';

class TakenSeat_metro extends ChangeNotifier{
  List<SeatNumber_metro> _seatList= [];


UnmodifiableListView<SeatNumber_metro> get seatList => UnmodifiableListView(_seatList);

set seatList(List<SeatNumber_metro> seatList) {
    _seatList = seatList;
    notifyListeners();
  }



}