import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconcontent.dart';
import 'reusablewid.dart';
import 'results.dart';
import 'calcbrain.dart';
const double btmheight = 70.0;
const inactivecolor = Color(0XFF242526);
const activecolor = Color(0xFF343434);
int height = 165;
int weight =55;
int age=30;
const txtstyle = Text(
  'NrN BMI Calculator',
  style: TextStyle(
    color: Color(0XFFFFFFFF),
    fontSize: 25,
  ),
);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = inactivecolor;
  Color femalecolor = inactivecolor;
  Gender selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                color: Color(0XFFFFFFFF),
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: ContainerCardRep(
                      colour: selectedgender == Gender.male
                          ? activecolor
                          : inactivecolor,
                      childwid: IconContent(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: ContainerCardRep(
                      colour: selectedgender == Gender.female
                          ? activecolor
                          : inactivecolor,
                      childwid: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ContainerCardRep(
                colour: activecolor,
                childwid: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                            fontWeight: FontWeight.w900),),
                          SizedBox(
                            width: 5,
                          ),
                          Text('cm',style: TextStyle(fontSize: 15,color: Colors.white),),

                        ],
                      ),
                      SliderTheme(
                        data:SliderTheme.of(context).copyWith(
                          thumbShape:RoundSliderThumbShape(enabledThumbRadius: 12),
                        ),
                        child: Slider(value: height.toDouble(), activeColor:Colors.red,inactiveColor: Colors.amberAccent,max:200,min:100,onChanged:(double newval)
                        {
                          setState(() {
                            height=newval.toInt();
                          });
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ContainerCardRep(
                    colour: activecolor,
                    childwid: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style: TextStyle(
                          fontSize: 20,
                        ),),
                        Text(weight.toString(),style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconu(icon: FontAwesomeIcons.plus,
                            onpre: ()
                              {
                                setState(() {
                                  weight+=1;
                                });
                              },),
                            SizedBox(
                              width:15
                              ,
                            ),
                            RoundIconu(icon: FontAwesomeIcons.minus,
                              onpre: ()
                              {
                                setState(() {
                                  weight-=1;
                                });
                              },),

                          ],
                        )
                      ],
                    ),
                    
                  ),
                ),
                  Expanded(
                  child: ContainerCardRep(
    colour: activecolor,
    childwid: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('AGE',style: TextStyle(
    fontSize: 20,
    ),),
    Text(age.toString(),style: TextStyle(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.w900),),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    RoundIconu(icon: FontAwesomeIcons.plus,
    onpre: ()
    {
    setState(() {
    age+=1;
    });
    },),
    SizedBox(
    width:15
    ,
    ),
    RoundIconu(icon: FontAwesomeIcons.minus,
    onpre: ()
    {
    setState(() {
    age-=1;
    });
    },),

    ],
    )
    ],
    ),

    ),
    ),
              ],
            )),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return results(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));},
              child: Container(
                  child: Center(
                    child: Text('CALCULATE',
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
                  height: btmheight),
            )
          ],
        ));
  }
}

class RoundIconu extends StatelessWidget {
  RoundIconu({this.icon,this.onpre});
  IconData icon;
  Function onpre;
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      onPressed: onpre,
      child: Icon(icon,color: Colors.white60,),
      shape: CircleBorder(),
      fillColor: Color(0XFF181818),
      constraints: BoxConstraints.tightFor(
        height: 50,
        width: 50
      ),

    );
  }
}
