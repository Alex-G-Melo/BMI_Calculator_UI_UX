import 'package:flutter/material.dart';
import '../constans.dart';

class ReCol extends StatelessWidget {
  final IconData icon;
  final String text;

  ReCol({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          text,
          style: kTStyle,
        ),
      ],
    );
  }
}
