import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent(@required this.icon,@required this.txt);
  IconData icon;
  String txt;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          size: 60,),
        SizedBox(
          height: 15,
        ),
        Text(txt,style: TextStyle(
          fontSize: 20,
        ),)
      ],
    );
  }
}