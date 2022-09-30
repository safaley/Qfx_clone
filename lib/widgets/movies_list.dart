import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../modal/movie.dart';
import 'package:flash/flash.dart';

final _firestore = FirebaseFirestore.instance;

class MoviesList extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? onLongPress;
  MoviesList({required this.movies, this.onLongPress});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  void initState() {
    super.initState();
  }

  void _showBasicsFlash({
    Duration? duration,
    flashStyle = FlashBehavior.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: flashStyle,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text('Added To Favourites'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List movies = widget.movies;
    return ResponsiveGridList(
        desiredItemWidth: 150,
        minSpacing: 10,
        children: movies.length != 0
            ? movies.map((movie) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onLongPress: (() {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    title: Text('Add to favourites ?'),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          _firestore.collection('movies').add({
                                            'image': movie.imageString,
                                            'title': movie.titleString
                                          });

                                          Navigator.pop(context);
                                          _showBasicsFlash(
                                              duration: Duration(seconds: 2));
                                        },
                                        child: Text('Yes'),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('No'),
                                      )
                                    ],
                                  )));
                        }),
                        child: Container(
                          foregroundDecoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(movie.imageString),
                                  fit: BoxFit.fill)),
                          height: 250,
                          alignment: Alignment(0, 0),
                          child: null,
                        ),
                      ),
                      Text(
                        movie.titleString,
                        style: kTitleTextStyle,
                      ),
                      Text(
                        'PG',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
                      )
                    ],
                  ),
                );
              }).toList()
            : [
                Text('No movies here'),
              ]);
  }
}
