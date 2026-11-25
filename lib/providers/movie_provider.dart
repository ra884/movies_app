import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  Movies? moviesObject;
  Future<void> RequestMovies() async {
    moviesObject = await MovieService.RequestMovies();
    notifyListeners();
  }
}
