import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weddingo/ui/hall_details_screen.dart';
class HallDirection extends StatelessWidget
{
  static const String routeName='HallDirection';
  double lat=HallDetailsScreen.hall2.Latitude??0.0;
  double lng=HallDetailsScreen.hall2.Longitude??0.0;
 late CameraPosition hallPosition=
    CameraPosition(
      target: LatLng(lat,lng),
      zoom: 15
    );
  late LatLng latlng=
     LatLng(lat,lng);

 late Set<Marker>markers={
  Marker(
    markerId:MarkerId(HallDetailsScreen.hall2.MarkerId??'') ,
    position:latlng,
  )
};
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(initialCameraPosition:hallPosition,
              mapType:MapType.normal ,
              markers:markers,
              mapToolbarEnabled: true,
              compassEnabled: true,
              buildingsEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              trafficEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}