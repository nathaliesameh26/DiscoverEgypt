import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:mobileapplication/data/repo/events_provider.dart';
import 'package:mobileapplication/model/des_model.dart';
import 'package:mobileapplication/model/eventDes_model.dart';
import 'package:mobileapplication/model/event_model.dart';
import 'package:mobileapplication/screens/homeScreen.dart';
import 'package:mobileapplication/screens/wishlist_screen.dart';
import '../data/dataApp/wishlist_data.dart';

class EvntDestinationScreen extends ConsumerStatefulWidget {
  final eventDestination envdestination;

  EvntDestinationScreen({required this.envdestination});

  @override
  ConsumerState<EvntDestinationScreen> createState() =>
      _EvntDestinationScreenState();
}

class _EvntDestinationScreenState extends ConsumerState<EvntDestinationScreen> {
  // Text _buildRatingStars(int rating) {
  //   String stars = '';
  //   for (int i = 0; i < rating; i++) {
  //     stars += 'star';
  //   }
  //   stars.trim();
  //   return Text(stars);
  // }

  bool wishlistbool = false;
  @override
  Widget build(BuildContext context) {
    final wish = WishList();
    final PlacesData = ref.watch(eventsDataProvider);

    //final
    return Scaffold(
        appBar: AppBar(
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
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Stack(
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
                            'assets/background.jpg',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 430,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        bottom: 20.0,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // ignore: prefer_const_constructors
                              Text(
                                'Cairo',
                                // "${value.get('city')}",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),

                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: ListView.builder(
                                    itemCount: value.docs.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
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
                                            "${value.docs[index].get('location')}",
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
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
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      // itemCount: widget.destination.activities.length,
                      itemBuilder: (BuildContext context, index) {
                        eventimgDestination envdestination = eventdes[index];
                        // Activity activity =
                        //     widget.destination.activities[index];

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
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 120.0,
                                                child: Text(
                                                  "${value.docs[index].get('name')}",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${value.docs[index].get('price')}LE',
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    LikeButton(
                                                        onTap: (isLiked) async {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  WishlistScreen(
                                                                      value.docs[
                                                                          index],
                                                                      value
                                                                          .docs[
                                                                              index]
                                                                          .get(
                                                                              'id'))));
                                                    }),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/eventdetails',
                                                              arguments: index);
                                                        },
                                                        child: Text(
                                                          'Details',
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5.0),
                                              width: 65.0,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${value.docs[index].get('openingTime')} AM",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5.0),
                                              width: 65.0,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${value.docs[index].get('closingTime')} PM",
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 15.0,
                                top: 15.0,
                                bottom: 15.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    envdestination.imageUrl,
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




// FittedBox(fit: BoxFit.scaleDown,