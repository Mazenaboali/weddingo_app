import 'package:flutter/material.dart';
import 'package:weddingo/ui/My_Theme.dart';

class GovernorateTap extends StatelessWidget {
  String governorate;
  bool selected;
  GovernorateTap(this.selected,this.governorate);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selected ? MyTheme.lightTheme.primaryColor : Colors.white,
          border: Border.all(color: MyTheme.lightTheme.primaryColor)),
      child: Center(
        child: Text(
          governorate,
          style: TextStyle(color: selected ? Colors.white : MyTheme.lightTheme.primaryColor),
        ),
      ),
    );
  }
}
