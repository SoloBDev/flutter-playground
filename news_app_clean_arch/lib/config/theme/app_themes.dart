import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Mulish',
    appBarTheme: appBarTheme(),
  );
}


AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0, // this makes shadow of appbar to 0
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
    titleTextStyle: TextStyle(
      color: Color(0xFF8B8B8B),
      fontSize: 18,
    ),
  );
}