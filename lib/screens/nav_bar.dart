import 'package:flutter/material.dart';
import 'package:qfxclone_flutter/screens/login_screen.dart';
import '../widgets/custom_tile.dart';
import '../widgets/qfx_logo_painter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavBar extends StatelessWidget {
  static String id = '/navbar';
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.only(left: 85, right: 85, top: 60, bottom: 20),
            color: Color(0xFF5C5C5C),
            child: qfxLogo(100),
          ),
          CustomTile(
            iconData: FontAwesomeIcons.leftLong,
            title: 'Log Out',
            onpress: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
