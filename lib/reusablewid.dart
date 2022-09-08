import 'package:flutter/material.dart';
class ContainerCardRep extends StatelessWidget {
  const ContainerCardRep({@required this.colour,this.childwid});
  final Color colour;
  final Widget childwid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childwid,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}