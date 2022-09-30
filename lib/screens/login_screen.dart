import 'package:flutter/material.dart';
import 'package:qfxclone_flutter/screens/main_screen.dart';
import 'package:qfxclone_flutter/screens/register_screen.dart';
import 'package:qfxclone_flutter/widgets/qfx_logo_painter.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  bool validate = false;
  late String password;
  String errorMsg = '';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget showErrorMsg() {
    return Text(
      errorMsg,
      style: TextStyle(color: Colors.red),
    );
  }

  final _auth = FirebaseAuth.instance;
  bool spinner = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    errorMsg = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Color(0xff252525),
        ),
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 50,
                      child: qfxLogo(50),
                      backgroundColor: Color(0xff252525),
                    ),
                    SizedBox(height: 10),
                    errorMsg == ''
                        ? SizedBox(
                            height: 0,
                          )
                        : showErrorMsg(),
                    SizedBox(
                      height: 20,
                    ),
                    CustomizedTextField(
                      hintText: 'Enter your email',
                      iconData: Icons.person,
                      controller: _emailController,
                      onPress: ((value) {
                        email = value;
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomizedTextField(
                      hintText: 'Enter your password',
                      iconData: Icons.key,
                      controller: _passwordController,
                      obscureText: true,
                      onPress: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      btnName: 'LOGIN',
                      onTap: () async {
                        try {
                          setState(() {
                            spinner = true;
                          });
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);

                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, MainScreen.id);
                          }
                          setState(() {
                            spinner = false;
                          });
                        } catch (e) {
                          print(errorMsg);
                          setState(() {
                            errorMsg = e.toString();
                            spinner = false;
                          });

                          print(e);
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Don't have QFX account?"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      btnName: 'REGISTER HERE',
                      onTap: () {
                        _emailController.clear();
                        _passwordController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => RegisterScreen()),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
