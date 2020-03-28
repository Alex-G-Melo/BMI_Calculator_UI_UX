import 'package:flutter/material.dart';
import '../constans.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  BottomButton({@required this.onTap, @required this.buttonTitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          buttonTitle,
          style: kLargeBTStyle,
        ),
        padding: EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        color: kBottomCColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomCHeight,
      ),
      onTap: onTap,
    );
  }
}
