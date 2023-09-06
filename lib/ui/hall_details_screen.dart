import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weddingo/data_base/hall.dart';
import 'package:weddingo/ui/Hall_direction_widget.dart';
import 'package:weddingo/ui/My_Theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HallDetailsScreen extends StatefulWidget {
  static const routeName = 'HallDetailsScreen';
  static Hall hall2 = Hall(
      HallName: '',
      PrimaryImageUrl: '',
      PrimaryLocation: '',
      Latitude: 0.0,
      Longitude: 0.0,
      PhotosList: ['', ''],
      HallCapacity: '',
      PriceDescription: '',
      MarkerId: '',
      PhoneNumber: '',
      VideosList: ['', ''],
      RatingNumber: '');

  @override
  State<HallDetailsScreen> createState() => _HallDetailsScreenState();
}

class _HallDetailsScreenState extends State<HallDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyTheme.lightTheme.primaryColor,
          title: Text(HallDetailsScreen.hall2?.HallName ?? '')),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.jpg'),
                    fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    if (HallDetailsScreen.hall2.Latitude ==
                                            null ||
                                        HallDetailsScreen.hall2.Longitude ==
                                            null) {
                                      showMessage(context,
                                          'There is no direction of this hall available',
                                          posaction: 'ok');
                                    } else {
                                      Navigator.pushNamed(
                                          context, HallDirection.routeName);
                                    }
                                  },
                                  child: Icon(Icons.directions,
                                      size: 50,
                                      color: MyTheme.lightTheme.primaryColor)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Direction',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.reduce_capacity,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            HallDetailsScreen.hall2?.HallCapacity ?? '',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    print(HallDetailsScreen.hall2.PhoneNumber);
                                    var phoneNumber =
                                        HallDetailsScreen.hall2.PhoneNumber;
                                    var url = "tel://$phoneNumber";
                                    if (HallDetailsScreen.hall2.PhoneNumber ==
                                        null) {
                                      showMessage(
                                        context,
                                        'There is no phone number available',
                                        posaction: 'Ok',
                                      );
                                    } else {
                                      launch(url);
                                    }
                                  },
                                  child: Icon(
                                    Icons.call,
                                    size: 50,
                                    color: MyTheme.lightTheme.primaryColor,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Call',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Photos',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(
                              color: MyTheme.lightTheme.primaryColor,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                HallDetailsScreen.hall2.PhotosList![index],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: HallDetailsScreen.hall2.PhotosList?.length ?? 0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Prices details',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Center(
                          child: Text(
                            HallDetailsScreen.hall2?.PriceDescription ??
                                'there is no price details available',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Videos',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: HallDetailsScreen.hall2.VideosList == null
                      ? Center(
                          child: Text(
                              'There is no videos available for this hall'))
                      : ListView.builder(
                          itemBuilder: (_, index) {
                            YoutubePlayerController _controller =
                                YoutubePlayerController(
                              initialVideoId:
                                  HallDetailsScreen.hall2.VideosList?[index],
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                                forceHD: true,
                              ),
                            );
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: YoutubePlayer(
                                controller: _controller,
                                liveUIColor: Colors.amber,
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              HallDetailsScreen.hall2.VideosList?.length ?? 0,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(
    BuildContext context,
    String title, {
    String? posaction,
    String? negaction,
    VoidCallback? actionpos,
    VoidCallback? actionneg,
    bool isDismisible = false,
  }) {
    List<Widget> actions = [];
    if (posaction != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (actionpos != null) {
              actionpos();
            }
          },
          child: Text(posaction)));
    }
    if (negaction != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (actionneg != null) {
              actionneg();
            }
          },
          child: Text(negaction)));
    }
    showDialog(
        context: context,
        builder: (builcontext) {
          return AlertDialog(
            content: Text(title),
            actions: actions,
          );
        },
        barrierDismissible: isDismisible);
  }
}
