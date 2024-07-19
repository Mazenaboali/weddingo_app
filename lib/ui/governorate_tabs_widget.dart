import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddingo/data_base/My_database.dart';
import 'package:weddingo/data_base/hall.dart';
import 'package:weddingo/ui/governorate_tab_item.dart';
import 'package:weddingo/ui/hall_details_screen.dart';
import 'package:weddingo/ui/official_hall_widget.dart';

class GovernorateTabsWidget extends StatefulWidget {
  List<String> governorate = [
    'Minya',
    'Alexandria',
    'Aswan',
    'Asyut',
    'Beheira',
    'Cairo',
    'Dakahlia',
    'Damietta',
    'Fayoum',
    'Gharbia',
    'Giza',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Matrouh',
    'Monufia',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalyubia',
    'Qena',
    'Red Sea',
    'Sharqia',
    'Sohag',
    'South Sinai',
    'Suez',
  ];
  @override
  State<GovernorateTabsWidget> createState() => _GovernorateTabsWidgetState();
}

class _GovernorateTabsWidgetState extends State<GovernorateTabsWidget> {
  int selectedindex = 0;
  late String governortecomparedondatabase = widget.governorate[0];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.governorate.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedindex = index;
                print(index);
                governortecomparedondatabase = widget.governorate[index];
                setState(() {});
              },
              tabs: widget.governorate
                  .map(
                    (governorate) => GovernorateTap(
                        widget.governorate.indexOf(governorate) ==
                            selectedindex,
                        widget.governorate.elementAt(
                            widget.governorate.indexOf(governorate))),
                  )
                  .toList(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot<Hall>>(
                    stream: MyDataBase.getHallsRealTimeUpdates(
                        governortecomparedondatabase),
                    builder: (buildContext, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var halls =
                          snapshot.data?.docs.map((doc) => doc.data()).toList();
                      if (snapshot.hasError) {
                        return Center(child: Text('Error loading halls.'));
                      }
                      return halls?.length == 0
                          ? Center(
                              child: Text(
                                  'There is no halls available in this governorate '))
                          : ListView.builder(
                              itemBuilder: (_, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, HallDetailsScreen.routeName);
                                      HallDetailsScreen.hall2 = halls[index];
                                      print(halls[index].HallCapacity);
                                      print(halls[index].Longitude);
                                      print(halls[index].Latitude);
                                      print(halls[index].MarkerId);
                                      print(halls[index].PriceDescription);
                                      print(halls[index].HallCapacity);
                                    },
                                    child: HallWidget(halls![index]));
                              },
                              itemCount: halls?.length ?? 0,
                            );
                    })),
          ],
        ),
      ),
    );
  }
}
