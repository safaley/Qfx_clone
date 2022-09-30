import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qfxclone_flutter/modal/movie_data.dart';
import 'package:qfxclone_flutter/screens/comingsoon_screen.dart';
import 'package:qfxclone_flutter/screens/favourites.dart';
import 'package:qfxclone_flutter/screens/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:qfxclone_flutter/screens/login_screen.dart';
import 'package:qfxclone_flutter/screens/main_screen.dart';
import 'package:qfxclone_flutter/screens/nav_bar.dart';
import 'package:qfxclone_flutter/screens/nowshowing_screen.dart';
import 'package:qfxclone_flutter/screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        initialRoute: LoadingScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          ComingSoonScreen.id: (context) => ComingSoonScreen(),
          FavouritesScreen.id: (context) => FavouritesScreen(),
          LoadingScreen.id: (context) => LoadingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          MainScreen.id: (context) => MainScreen(),
          NavBar.id: (context) => NavBar(),
          NowShowingScreen.id: (context) => NowShowingScreen(),
          RegisterScreen.id: (context) => RegisterScreen()
        },
      ),
      create: (_) => MovieData(),
    );
  }
}
