import 'package:flutter/material.dart';

class MainTheme {
  ThemeData appTheme = ThemeData(
    primaryColor: Color.fromRGBO(0, 252, 172, 1),
    colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 252, 172, 1)),
    scaffoldBackgroundColor: Colors.black,

    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 34),
      toolbarTextStyle: TextStyle(color: Colors.white),
    ),
  );

  Color primaryColor = Color.fromRGBO(0, 252, 172, 1);
  Color boxColor = Color.fromRGBO(5, 32, 23, 1);
  Color boxBorderColor = Color.fromRGBO(2, 112, 73, 1);
  Color areaNeon = Color.fromRGBO(5, 54, 24, 1);
}
