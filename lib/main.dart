import 'package:flutter/material.dart';
import 'inputpage.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:InputPage(),
      theme:ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        primaryColor:const Color(0XFF181818),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0XFF181818),

        ),
        scaffoldBackgroundColor: Color(0XFF121212),
        textTheme: TextTheme(
          bodyText2: TextStyle(color:Color(0XFFB3B3B3))
        )
      ),
    );
  }
}

