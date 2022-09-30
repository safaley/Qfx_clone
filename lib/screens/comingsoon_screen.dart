import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qfxclone_flutter/modal/movie_data.dart';

import '../widgets/movies_list.dart';

class ComingSoonScreen extends StatelessWidget {
  static String id = '/coming_soon';
  @override
  Widget build(BuildContext context) {
    return MoviesList(
      movies: Provider.of<MovieData>(context).comingSoonMovies,
    );
  }
}
