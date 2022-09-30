import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final bool obscureText;
  final void Function(String value)? onPress;
  final String? errorText;
  final TextEditingController? controller;

  CustomizedTextField(
      {required this.hintText,
      required this.iconData,
      this.obscureText = false,
      this.controller,
      this.errorText,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onPress,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        prefixIconColor: Colors.black,
        fillColor: Colors.grey.shade600,
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        hintText: hintText,
        errorText: errorText,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        prefixIcon: Icon(
          iconData,
          size: 30,
          color: Colors.grey.shade600,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff7941d)),
        ),
      ),
    );
  }
}
