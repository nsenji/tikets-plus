import 'package:cinema_tikets/models/seatNumbers_from_firestore/for_metro/seatNumber_metro.dart';
import 'package:cinema_tikets/notifiers/for_metro/taken_seat_notifier_metro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getSeat_metro(TakenSeat_metro takenSeat_metro) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Seats_metro').get();

  List<SeatNumber_metro> _seatList = [];
  dynamic value;

  snapshot.docs.forEach((element) {
    {
      SeatNumber_metro seatNumber = SeatNumber_metro.fromMap(element);
      _seatList.add(seatNumber);
    }
  });

  takenSeat_metro.seatList = _seatList;
}

addSeat_metro(int index) async {
  final washingtonRef = FirebaseFirestore.instance
      .collection("Seats_metro")
      .doc("nTjLE7XzcM8aq3wfyk8X");

// Atomically add a new region to the "regions" array field.
  washingtonRef.update({
    "name": FieldValue.arrayUnion([index]),
  });
}

removeSeat_metro(int index) async {
  final washingtonRef = FirebaseFirestore.instance
      .collection("Seats_metro")
      .doc("nTjLE7XzcM8aq3wfyk8X");

  washingtonRef.update({
    "name": FieldValue.arrayRemove([index]),
  });
}

