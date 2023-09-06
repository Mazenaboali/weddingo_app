import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weddingo/ui/My_Theme.dart';
import 'package:weddingo/ui/home_screen.dart';

class SplashScreen extends StatefulWidget
{
  static String routeName='SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    // TODO: implement build
    return Stack(
      children: [

        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splashScreenImage.jpg'), fit: BoxFit.fill)),
        ),
        Scaffold(
          backgroundColor:Colors.transparent,
          body: Center(child: Image.asset('assets/images/logo.png')),
        ),
      ],
    );
  }
}