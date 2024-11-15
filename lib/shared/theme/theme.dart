import 'package:flutter/material.dart';

var activecolor = Colors.white;
var inactiveColor = Colors.white30;
ThemeData light = ThemeData(
    primaryColor: Colors.green,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.green,
    selectedItemColor: activecolor,
    unselectedItemColor: inactiveColor,
  )
);
