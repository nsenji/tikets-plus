import 'dart:io';
import 'package:cinema_tikets/models/get_seatList_model.dart';
import 'package:cinema_tikets/models/movie_model.dart';
import 'package:cinema_tikets/notifiers/movie_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../notifiers/seat_number_notifier.dart';
import '../notifiers/taken_seat_notifier.dart';

getMovie(MovieNotifier movieNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Movies').get();

  List<Movie> _movieList = [];

  snapshot.docs.forEach((document) {
    Movie movie = Movie.fromMap(document);
    _movieList.add(movie);
  });

  movieNotifier.movieList = _movieList;
}

//

// addSeat(stuff) {
//   // Add a new document with a generated id.
//   final data = {"name": stuff};

//   FirebaseFirestore.instance
//       .collection("Seats")
//       .doc('82TvfV6vIksgjITayEy0')
//       .update(data);
// }

getSeat(TakenSeat takenSeat) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Seats').get();

  List<SeatNumber> _seatList = [];
  dynamic value;

  snapshot.docs.forEach((element) {
    {
      SeatNumber seatNumber = SeatNumber.fromMap(element);
      _seatList.add(seatNumber);
    }
  });

  takenSeat.seatList = _seatList;
}

addSeat(int index) async {
  final washingtonRef = FirebaseFirestore.instance
      .collection("Seats")
      .doc("82TvfV6vIksgjITayEy0");

// Atomically add a new region to the "regions" array field.
  washingtonRef.update({
    "name": FieldValue.arrayUnion([index]),
  });
}

removeSeat(int index) async {
  final washingtonRef = FirebaseFirestore.instance
      .collection("Seats")
      .doc("82TvfV6vIksgjITayEy0");

  washingtonRef.update({
    "name": FieldValue.arrayRemove([index]),
  });
}


 




// final washingtonRef = FirebaseFirestore.instance.collection("cites").doc("DC");
//     washingtonRef.update({"capital": true}).then(
//     (value) => print("DocumentSnapshot successfully updated!"),
//     onError: (e) => print("Error updating document $e"));
