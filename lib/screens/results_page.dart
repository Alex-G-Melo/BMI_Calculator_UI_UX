import 'package:bmirechner/components/bottom-Button.dart';
import 'package:bmirechner/components/reusable_container.dart';
import 'package:flutter/material.dart';

import '../constans.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text(
//          'Dein Ergebnis',
//          style: kTStyle,
//        ),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Dein Ergebnis',
                style: kTitleTStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReCont(
              color: kActiveCont,
              contChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'Erneut rechnen',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
