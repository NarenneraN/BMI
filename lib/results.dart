import 'package:bmi/reusablewid.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class results extends StatelessWidget {
  results(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ContainerCardRep(
              colour: kActiveCardColour,
              childwid: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                  bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
                child: Center(
                  child: Text('RECALCULATE',
                    textAlign:TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color:Colors.white,
                        fontWeight: FontWeight.w300
                    ),),
                ),
                color: Color(0XFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 60),
          )
        ],
      ),
    );
  }
}