import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Function onLongPress;
  RoundIconButton({
    @required this.icon,
    @required this.onPressed,
    /*@required*/ this.onLongPress,
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onLongPress: onLongPress,
      onPressed: onPressed,
      elevation: 6,
      disabledElevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
