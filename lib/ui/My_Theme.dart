import 'package:flutter/material.dart';

class MyTheme
{
  static final myTheme=ThemeData(
      primaryColor: Color(0xff598158),
      textTheme: TextTheme(
          headline6: TextStyle(
            fontSize:22 ,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
      )
  );
}