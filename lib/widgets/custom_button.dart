import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final VoidCallback? onTap;
  const CustomButton({required this.btnName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: onTap,
      color: Colors.grey.shade600,
      height: 45,
      child: Text(
        btnName,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
