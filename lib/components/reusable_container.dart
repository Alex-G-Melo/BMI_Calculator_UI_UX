import 'package:flutter/material.dart';

class ReCont extends StatelessWidget {
  final Color color;
  final Widget contChild;
  final Function onPress;

  ReCont({@required this.color, this.contChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: contChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
