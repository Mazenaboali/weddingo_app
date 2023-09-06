import 'package:flutter/material.dart';
import 'package:weddingo/data_base/hall.dart';
import 'package:weddingo/ui/My_Theme.dart';

class HallWidget extends StatelessWidget {
  Hall hall;
  HallWidget(this.hall);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //image widget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                image: DecorationImage(
                  image:  NetworkImage(
                    hall?.PrimaryImageUrl??'',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),  
          ),

          //description image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: MyTheme.lightTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(hall?.HallName??'',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                )),
                          ),
                          SizedBox(width: 10,),
                          hall.RatingNumber==null?Container():
                          Row(
                            children: [
                              Icon(Icons.star,size: 20,color: Color(0xFFffd100)),
                              SizedBox(width: 5,),
                              Text(hall?.RatingNumber??'',style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                               hall?.PrimaryLocation??'',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Click for more details',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
