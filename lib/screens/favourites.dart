import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qfxclone_flutter/components/constants.dart';
import 'package:flash/flash.dart';

final _firestore = FirebaseFirestore.instance;

class FavouritesScreen extends StatelessWidget {
  static String id = 'favourites_screen';
  const FavouritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MovieStream());
  }
}

class MovieStream extends StatelessWidget {
  const MovieStream({super.key});
  Future<void> deleteMovie(String docId) {
    return _firestore.collection('movies').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
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
              content: Text('Movie Deleted'),
            ),
          );
        },
      );
    }

    return StreamBuilder(
        stream: _firestore.collection('movies').snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                final DocumentSnapshot movieSnapshot =
                    snapshot.data!.docs[index];
                print(movieSnapshot);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              foregroundDecoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(movieSnapshot['image']),
                                      fit: BoxFit.fill)),
                              height: 250,
                              alignment: Alignment(0, 0),
                              child: null,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          title: Text(
                                              'Delete this movie from Favourites ?'),
                                          actions: [
                                            MaterialButton(
                                              onPressed: () {
                                                deleteMovie(movieSnapshot.id);
                                                Navigator.pop(context);
                                                _showBasicsFlash(
                                                    duration:
                                                        Duration(seconds: 2));
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
                                        )),
                                  );
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 40,
                                  color: Colors.red,
                                ),
                              ))
                        ],
                      ),
                      Text(
                        movieSnapshot['title'],
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
              }),
            );
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}



// StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('movies').snapshots(),
//         builder: ((context, snapshot) {
//           List<Movie> favouriteMovies = [];

//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.red,
//               ),
//             );
//           } else {
//             final movies = snapshot.data!.docs;
//             for (var movie in movies) {
//               favouriteMovies.add(
//                 Movie(imageString: movie['image'], titleString: movie['title']),
//               );
//             }
//             print(favouriteMovies[0].imageString);
//           }
//           return ResponsiveGridList(
//               desiredItemWidth: 150,
//               minSpacing: 10,
//               children: favouriteMovies.length != 0
//                   ? favouriteMovies.map((movie) {

//                     }).toList()
//                   : [
//                       Text('No movies here'),
//                     ]);
//           ;
//         }));