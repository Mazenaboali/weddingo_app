import 'package:flutter/material.dart';
import 'package:weddingo/governorate_tabs_widget.dart';
import 'package:weddingo/ui/My_Theme.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'), fit: BoxFit.fill)),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: MyTheme.lightTheme.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            title: Text('WEDDINGO'),
            centerTitle: true,
          ),
          body: GovernorateTabsWidget()),
    ]);
  }
}
