import 'package:flutter/material.dart';

class MyTheme
{
  static final lightTheme=ThemeData(
      primaryColor: Color(0xFF588157),
      textTheme: TextTheme(
          headline6: TextStyle(
            fontSize:22 ,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
      )
  );
}