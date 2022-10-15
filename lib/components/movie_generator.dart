import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:qfxclone_flutter/components/constants.dart';
import 'package:qfxclone_flutter/modal/movie.dart';

class MovieGenerator {
  List<Movie> movies = [];

  Future<List> getMovie(String sort_by) async {
    var url = Uri.https(
      'api.themoviedb.org',
      '/3/discover/movie',
      {'api_key': apiKey, 'sort_by': sort_by},
    );
    http.Response response = await http.get(url);
    List data = json.decode(response.body)['results'];
    for (var movie in data.getRange(0, 10)) {
      String movie_title = movie['title'];
      String movie_image =
          "https://image.tmdb.org/t/p/original" + movie['poster_path'];
      movies.add(Movie(imageString: movie_image, titleString: movie_title));
    }

    return movies;
  }
}
