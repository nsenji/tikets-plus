import 'dart:collection';

import 'package:cinema_tikets/models/movie_model.dart';
import 'package:flutter/cupertino.dart';

class MovieNotifier extends ChangeNotifier {
  List<Movie> _movieList = [];
  late Movie _currentMovie;

  UnmodifiableListView<Movie> get movieList => UnmodifiableListView(_movieList);

  set movieList(List<Movie> movieList) {
    _movieList = movieList;
    notifyListeners();
  }

  Movie get currentMovie => _currentMovie;
}
