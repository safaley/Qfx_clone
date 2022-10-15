import 'package:flutter/material.dart';
import 'package:qfxclone_flutter/screens/nav_bar.dart';
import '../widgets/qfx_logo_painter.dart';
import 'comingsoon_screen.dart';
import 'favourites.dart';
import 'nowshowing_screen.dart';

class MainScreen extends StatefulWidget {
  static String id = '/main';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List tabs = [NowShowingScreen(), ComingSoonScreen(), FavouritesScreen()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: tabs[_currentIndex],
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xff252525),
        title: qfxLogo(55),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff252525),
        selectedItemColor: Color(0xfff7941d),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (value) => setState(
          () {
            _currentIndex = value;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.now_wallpaper),
            label: 'Now Showing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Coming Soon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}
