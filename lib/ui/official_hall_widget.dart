import 'package:flutter/material.dart';
import 'package:weddingo/data_base/hall.dart';
import 'package:weddingo/ui/My_Theme.dart';

class HallWidget extends StatelessWidget {
  Hall hall;
  HallWidget(this.hall);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //image widget
          Container(

            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Specify the shadow color
                  spreadRadius: 5, // Specify the spread radius of the shadow
                  blurRadius: 4, // Specify the blur radius of the shadow
                  offset: Offset(0, 3), // Specify the offset of the shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              image: DecorationImage(
                image:  NetworkImage(
                  hall.PrimaryImageUrl??'',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),

          //description image
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Specify the shadow color
                    spreadRadius: 5, // Specify the spread radius of the shadow
                    blurRadius: 7, // Specify the blur radius of the shadow
                    offset: Offset(0, 3), // Specify the offset of the shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(hall.HallName??'',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                      ),
                      SizedBox(width:20,),
                      hall.RatingNumber==null?Container():
                         Row(
                           children: [
                             Icon(Icons.star,size: 20,color: Color(0xFFffd100)),
                             SizedBox(width: 5,),
                             Text(hall.RatingNumber??'',style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w700
                             ),)
                           ],
                         ),



                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/location-icon.png',
                            width: 20,
                            height: 20,
                          ),
                          Container(width: 10,),
                          Text(
                            hall.PrimaryLocation??'',
                            style: TextStyle( fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        'Click for more details',
                        style: TextStyle(
                          fontSize: 12,

                        ),
                      ),
                    ],
                  )
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
