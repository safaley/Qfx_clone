import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qfxclone_flutter/widgets/custom_button.dart';
import 'package:qfxclone_flutter/widgets/custom_text_field.dart';
import 'package:qfxclone_flutter/widgets/qfx_logo_painter.dart';

class RegisterScreen extends StatelessWidget {
  static String id = '/register';
  final _auth = FirebaseAuth.instance;

  late String email;

  late String password;

  String? confirmedPassword;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Color(0xff252525),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 50,
                  child: qfxLogo(50),
                  backgroundColor: Color(0xff252525),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomizedTextField(
                  hintText: 'Full Name',
                  iconData: Icons.person,
                  controller: _nameController,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomizedTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  iconData: Icons.email,
                  onPress: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomizedTextField(
                  controller: _mobileController,
                  hintText: 'Mobile',
                  iconData: Icons.phone,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomizedTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  iconData: Icons.key,
                  obscureText: true,
                  onPress: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomizedTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  iconData: Icons.key,
                  obscureText: true,
                  onPress: (value) {
                    confirmedPassword = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  btnName: 'SIGN UP',
                  onTap: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pop(context);
                      }
                      _confirmPasswordController.clear();
                      _emailController.clear();
                      _mobileController.clear();
                      _nameController.clear();
                      _passwordController.clear();
                    } catch (e) {
                      print(e);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
