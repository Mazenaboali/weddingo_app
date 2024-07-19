import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weddingo/data_base/hall.dart';
import 'package:weddingo/ui/Hall_direction_widget.dart';
import 'package:weddingo/ui/My_Theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HallDetailsScreen extends StatefulWidget {
  static const routeName = 'HallDetailsScreen';
  String state = "details";
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
  int photoCounter = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/images/back-arrow.png',
              width: 45,
              height: 45,
            )),
        centerTitle: true,
        title: Text(
          HallDetailsScreen.hall2.HallName ?? '',
          style: TextStyle(
              color: MyTheme.myTheme.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 20,),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(
                        HallDetailsScreen.hall2.PhotosList![photoCounter],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              if (photoCounter == 0) {
                                photoCounter =
                                    HallDetailsScreen.hall2.PhotosList!.length -
                                        1;
                                setState(() {});
                              } else {
                                photoCounter--;
                                setState(() {});
                              }
                            },
                            child: Image.asset(
                              'assets/images/left-button.png',
                              width: 50,
                              height: 50,
                            )),
                        InkWell(
                            onTap: () {
                              if (photoCounter ==
                                  HallDetailsScreen.hall2.PhotosList!.length -
                                      1) {
                                photoCounter = 0;
                                setState(() {});
                              } else {
                                photoCounter++;
                                setState(() {});
                              }
                            },
                            child: Image.asset('assets/images/right-button.png',
                                width: 50, height: 50))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      photoCounter = 0;
                      setState(() {});
                    },
                    child: Container(
                      width: 75,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          image: NetworkImage(
                            HallDetailsScreen.hall2.PhotosList![0],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      photoCounter = 1;
                      setState(() {});
                    },
                    child: Container(
                      width: 75,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          image: NetworkImage(
                            HallDetailsScreen.hall2.PhotosList![1],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      photoCounter = 2;
                      setState(() {});
                    },
                    child: Container(
                      width: 75,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          image: NetworkImage(
                            HallDetailsScreen.hall2.PhotosList![2],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: MyTheme.myTheme.primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        '${HallDetailsScreen.hall2.PhotosList!.length - 3}+',
                        style: TextStyle(
                            color: MyTheme.myTheme.primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (HallDetailsScreen.hall2.Latitude == null ||
                          HallDetailsScreen.hall2.Longitude == null) {
                        showMessage(context,
                            'There is no direction of this hall available',
                            posaction: 'ok');
                      } else {
                        Navigator.pushNamed(context, HallDirection.routeName);
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/location-icon.png',
                          width: 23,
                          height: 23,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text(
                          'Location',
                          style: TextStyle(
                              color: MyTheme.myTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'NunitoSans'),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print(HallDetailsScreen.hall2.PhoneNumber);
                      var phoneNumber = HallDetailsScreen.hall2.PhoneNumber;
                      var url = "tel://$phoneNumber";
                      if (HallDetailsScreen.hall2.PhoneNumber == null) {
                        showMessage(
                          context,
                          'There is no phone number available',
                          posaction: 'Ok',
                        );
                      } else {
                        launch(url);
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/phone-icon.png',
                          width: 23,
                          height: 23,
                        ),
                        Container(
                          width: 5,
                        ),
                        Text(
                          'Phone number',
                          style: TextStyle(
                              color: Color(0xff598158),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'NunitoSans'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.state == 'details'
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              widget.state = "details";
                            });
                          },
                          child: Container(
                            height: 38,
                            width: 115,
                            decoration: BoxDecoration(
                                color: MyTheme.myTheme.primaryColor,
                                borderRadius: BorderRadius.circular(56),
                                border: Border.all(
                                    color: MyTheme.myTheme.primaryColor)),
                            child: Center(
                                child: Text(
                              'Details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'NunitoSans',
                                  fontSize: 12),
                            )),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              widget.state = "details";
                            });
                          },
                          child: Container(
                            height: 38,
                            width: 115,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(56),
                                border: Border.all(
                                    color: MyTheme.myTheme.primaryColor)),
                            child: Center(
                                child: Text(
                              'Details',
                              style: TextStyle(
                                  color: MyTheme.myTheme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'NunitoSans',
                                  fontSize: 12),
                            )),
                          ),
                        ),
                  widget.state == 'Videos'
                      ? InkWell(
                    onTap: () {
                      setState(() {
                        widget.state = "Videos";
                      });
                    },
                    child: Container(
                      height: 38,
                      width: 115,
                      decoration: BoxDecoration(
                          color: MyTheme.myTheme.primaryColor,
                          borderRadius: BorderRadius.circular(56),
                          border: Border.all(
                              color: MyTheme.myTheme.primaryColor)),
                      child: Center(
                          child: Text(
                            'Videos',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'NunitoSans',
                                fontSize: 12),
                          )),
                    ),
                  )
                      : InkWell(
                    onTap: () {
                      setState(() {
                        widget.state = "Videos";
                      });
                    },
                    child: Container(
                      height: 38,
                      width: 115,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56),
                          border: Border.all(
                              color: MyTheme.myTheme.primaryColor)),
                      child: Center(
                          child: Text(
                            'Videos',
                            style: TextStyle(
                                color: MyTheme.myTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'NunitoSans',
                                fontSize: 12),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            widget.state=='details'?Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Capacity : up to ${HallDetailsScreen.hall2.HallCapacity} person'),
                
                    Text('Description : ${HallDetailsScreen.hall2.PriceDescription}'),
                  ],
                ),
              ),
            ): SizedBox(
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
                scrollDirection: Axis.vertical,
                itemCount:
                HallDetailsScreen.hall2.VideosList?.length ?? 0,
              ),
            ),
            
          ],
        ),
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
