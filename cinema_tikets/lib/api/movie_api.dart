import 'dart:io';
import 'package:cinema_tikets/models/movie_model.dart';
import 'package:cinema_tikets/notifiers/movie_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../notifiers/seat_number_notifier.dart';

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

addSeat(stuff) {
  // Add a new document with a generated id.
  final data = {"name": stuff};

  FirebaseFirestore.instance
      .collection("Seats")
      .doc('82TvfV6vIksgjITayEy0')
      .update(data);
}

// final washingtonRef = FirebaseFirestore.instance.collection("cites").doc("DC");
//     washingtonRef.update({"capital": true}).then(
//     (value) => print("DocumentSnapshot successfully updated!"),
//     onError: (e) => print("Error updating document $e"));