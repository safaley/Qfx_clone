import 'package:flutter/material.dart';
import 'package:qfxclone_flutter/modal/movie.dart';

class MovieData extends ChangeNotifier {
  var movieImages;
  var movieTitles;

  List<Movie> nowShowingMovies = [];
  List<Movie> comingSoonMovies = [];

  void newNowShowingMovie(Movie movie) {
    nowShowingMovies.add(movie);
  }

  void newComingSoonMovie(Movie movie) {
    comingSoonMovies.add(movie);
  }

  // void newMovieImages(image) {
  //   movieImages = image;
  //   notifyListeners();
  // }

  // void newMovieTitles(title) {
  //   movieTitles = title;
  //   notifyListeners();
  // }

  int get movieCount {
    return movieTitles.length;
  }

  void removeMovie(image, title) {
    movieImages.remove(image);
    movieTitles.remove(title);
  }
}
