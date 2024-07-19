import 'package:flutter/material.dart';
import 'package:weddingo/ui/governorate_tabs_widget.dart';
import 'package:weddingo/ui/My_Theme.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: MyTheme.myTheme.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          title: Text('Weddingo',style: TextStyle(
            color: Colors.white,
            fontFamily: 'NunitoSans',
            fontSize: 27,
            fontWeight: FontWeight.w700
          )),
          centerTitle: true,
        ),
        body: GovernorateTabsWidget());
  }
}
