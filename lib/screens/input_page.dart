import 'package:bmirechner/components/reusable_container.dart';
import 'package:bmirechner/components/round_icon_button.dart';
import 'package:bmirechner/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../components/bottom-Button.dart';
import '../constans.dart';
import '../components/icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selGender;
  int height = 180;
  int weight = 60;
  int age = 25;

//  Color maleColor = inactiveCont;
//  Color femaleColor = inactiveCont;
//  void updateColor(Gender sGender) {
//    if (sGender == Gender.male) {
//      if (maleColor == inactiveCont) {
//        maleColor = activeCont;
//        femaleColor = inactiveCont;
//      } else {
//        maleColor = inactiveCont;
//      }
//    }
//    if (sGender == Gender.female) {
//      if (femaleColor == inactiveCont) {
//        femaleColor = activeCont;
//        maleColor = inactiveCont;
//      } else {
//        femaleColor = inactiveCont;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Rechner'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReCont(
                    onPress: () {
                      setState(() {
                        selGender = Gender.male;
                      });
                    },
                    color:
                        selGender == Gender.male ? kActiveCont : kInactiveCont,
                    contChild: ReCol(
                      icon: FontAwesomeIcons.mars,
                      text: 'Männlich',
                    ),
                  ),
                ),
                Expanded(
                  child: ReCont(
                    onPress: () {
                      setState(() {
                        selGender = Gender.female;
                      });
                    },
                    color: selGender == Gender.female
                        ? kActiveCont
                        : kInactiveCont,
                    contChild: ReCol(
                      icon: FontAwesomeIcons.venus,
                      text: 'Weiblich',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReCont(
              color: kActiveCont,
              contChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Körpergröße in Zentimeter',
                    style: kTStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumTStyle,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'cm',
                        style: kTStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 240,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReCont(
                    color: kActiveCont,
                    contChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Gewicht',
                          style: kTStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumTStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
//                              onLongPress: () {
//                                setState(() {
//                                  weight--;
//                                });
//                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReCont(
                    color: kActiveCont,
                    contChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Alter',
                          style: kTStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumTStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
//                              onLongPress: () {
//                                setState(() {
//                                  age--;
//                                });
//                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Rechnen',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
