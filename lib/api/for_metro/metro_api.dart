// import 'package:cinema_tikets/models/model_List_of_taken_seats_for_acacia/metro_list.dart';
// import 'package:cinema_tikets/notifiers/for_metro/taken_seat_notifier_metro.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// getSeat_metro(TakenSeat_metro takenseatMetro) async {
//   QuerySnapshot snapshot =
//       await FirebaseFirestore.instance.collection('Seats_metro').get();

//   List<SeatNumber_metro> seatList = [];
//   dynamic value;

//   for (var element in snapshot.docs) {
//     {
//       SeatNumber_metro seatNumber = SeatNumber_metro.fromMap(element);
//       seatList.add(seatNumber);
//     }
//   }

//   takenseatMetro.seatList = seatList;
// }

// addSeat_metro(int index) async {
//   final washingtonRef = FirebaseFirestore.instance
//       .collection("Seats_metro")
//       .doc("nTjLE7XzcM8aq3wfyk8X");

// // Atomically add a new region to the "regions" array field.
//   washingtonRef.update({
//     "name": FieldValue.arrayUnion([index]),
//   });
// }

// removeSeat_metro(int index) async {
//   final washingtonRef = FirebaseFirestore.instance
//       .collection("Seats_metro")
//       .doc("nTjLE7XzcM8aq3wfyk8X");

//   washingtonRef.update({
//     "name": FieldValue.arrayRemove([index]),
//   });
// }

