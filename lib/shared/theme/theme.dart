import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var activecolor = Colors.white;
var inactiveColor = Colors.white30;
ThemeData light = ThemeData(
  textTheme: GoogleFonts.interTextTheme(),
    primaryColor: Colors.green[900],
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.green[900],
    selectedItemColor: activecolor,
    unselectedItemColor: inactiveColor,
  )
);
