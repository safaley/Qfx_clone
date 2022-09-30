import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback? onpress;

  CustomTile({required this.iconData, required this.title, this.onpress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      leading: RawMaterialButton(
        onPressed: (() => null),
        fillColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        child: FaIcon(
          iconData,
          size: 30,
          semanticLabel: title,
        ),
      ),
      title: Align(
        child: Text(title,
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
        alignment: Alignment(-1.4, -0.2),
      ),
    );
  }
}
