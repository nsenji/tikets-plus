import 'dart:collection';

import 'package:cinema_tikets/Custom_widgets/seatNumbers_from_firestore/for_acacia/get_seatList_model.dart';
import 'package:flutter/cupertino.dart';

class TakenSeat extends ChangeNotifier{
  List<SeatNumber> _seatList= [];


UnmodifiableListView<SeatNumber> get seatList => UnmodifiableListView(_seatList);

set seatList(List<SeatNumber> seatList) {
    _seatList = seatList;
    notifyListeners();
  }



}