import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:mobileapplication/data/repo/places_provider.dart';
import 'package:mobileapplication/screens/homeScreen.dart';
import '../model/destination_model.dart';
import '../model/activity_model.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  final Destination destination;

  DestinationScreen({required this.destination});

  @override
  ConsumerState<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends ConsumerState<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += 'star';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    final PlacesData = ref.watch(placesDataProvider);
    return Scaffold(
        appBar: AppBar(
          //leading: new Icon(Icons.arrow_back),
          //title: const Text('SnapNews'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (_) => HomeScreenn()));
              },
            ),
          ],
        ),
        body: PlacesData.when(
          data: (value) => SafeArea(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            )
                          ]),
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/Egypt.jpg',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 430,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 10.0, vertical: 40.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       IconButton(
                    //         icon: Icon(Icons.arrow_back),
                    //         iconSize: 30.0,
                    //         color: Colors.black,
                    //         onPressed: () => Navigator.pop(context),
                    //       ),
                    //       Row(
                    //         children: <Widget>[
                    //           IconButton(
                    //             icon: Icon(Icons.search),
                    //             iconSize: 30.0,
                    //             color: Colors.black,
                    //             onPressed: () => Navigator.pop(context),
                    //           ),
                    //           Row(
                    //             children: <Widget>[
                    //               IconButton(
                    //                 icon: Icon(Icons.sort),
                    //                 iconSize: 25.0,
                    //                 color: Colors.black,
                    //                 onPressed: () => Navigator.pop(context),
                    //               ),
                    //             ],
                    //           )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Positioned(
                      left: 20.0,
                      bottom: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${value.get('city')}",
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.location_on,
                                size: 15.0,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "${value.get('location')}",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 20.0,
                      bottom: 20.0,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white70,
                        size: 25.0,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      itemCount: widget.destination.activities.length,
                      itemBuilder: (BuildContext context, index) {
                        Activity activity =
                            widget.destination.activities[index];

                        return Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                              height: 170.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    100.0, 20.0, 20.0, 20.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            child: Text(
                                              "${value.get('name')}",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${value.get('price')}LE',
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                LikeButton(),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/detailsPage');
                                                    },
                                                    child: Text(
                                                      'Details',
                                                    ))
                                                // const Text(
                                                //   'per pax',
                                                //   style: TextStyle(
                                                //     color: Colors.grey,
                                                //     fontSize: 22.0,
                                                //     fontWeight: FontWeight.w600,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      //Text(activity.type, style: TextStyle()),
                                      //_buildRatingStars(activity.rating),
                                      SizedBox(
                                        height: 1.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).accentColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${value.get('openingtime')} AM",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            width: 65.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).accentColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${value.get('closingtime')} PM",
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                            Positioned(
                                left: 20.0,
                                top: 15.0,
                                bottom: 15.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    'assets/Egypt.jpg',
                                    width: 110.0,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
          error: (Object error, StackTrace stackTrace) {},
          loading: () {},
        ));
  }
}
