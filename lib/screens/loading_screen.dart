import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qfxclone_flutter/modal/movie_data.dart';
import 'package:qfxclone_flutter/screens/login_screen.dart';
import '../components/movie_generator.dart';
import '../widgets/qfx_logo_painter.dart';

class LoadingScreen extends StatefulWidget {
  static String id = '/';
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var nowShowingMovies;
  var comingSoonMovies;

  @override
  void initState() {
    super.initState();
    getMovieDetails();
  }

  void getMovieDetails() async {
    MovieGenerator nowShowingmovieGenerator = MovieGenerator();
    nowShowingMovies =
        await nowShowingmovieGenerator.getMovie('popularity.desc');
    MovieGenerator comingSoonMovieGenerator = MovieGenerator();
    comingSoonMovies =
        await comingSoonMovieGenerator.getMovie('release_date.asc');
    for (var movie in nowShowingMovies) {
      Provider.of<MovieData>(context, listen: false).newNowShowingMovie(movie);
    }

    for (var movie in comingSoonMovies) {
      Provider.of<MovieData>(context, listen: false).newComingSoonMovie(movie);
    }
    Navigator.pushNamed(
      context,
      LoginScreen.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          qfxLogo(150),
          SizedBox(
            height: 30.0,
          ),
          SpinKitDualRing(
            color: Colors.white,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
