
import 'dart:io';
import 'package:cinema_tikets/models/movie_model.dart';
import 'package:cinema_tikets/notifiers/movie_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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
