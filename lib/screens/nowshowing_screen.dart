import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qfxclone_flutter/modal/movie_data.dart';

import '../widgets/movies_list.dart';

class NowShowingScreen extends StatelessWidget {
  static String id = 'now_showing_screen';
  const NowShowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MoviesList(
      movies: Provider.of<MovieData>(context).nowShowingMovies,
    );
  }
}
