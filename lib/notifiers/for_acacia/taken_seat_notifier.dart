import 'dart:collection';

import 'package:cinema_tikets/models/model_List_of_taken_seats_for_acacia/acacia_list.dart';
import 'package:flutter/cupertino.dart';

class TakenSeat extends ChangeNotifier{
  List<SeatNumber> _seatList= [];


UnmodifiableListView<SeatNumber> get seatList => UnmodifiableListView(_seatList);

set seatList(List<SeatNumber> seatList) {
    _seatList = seatList;
    notifyListeners();
  }



}