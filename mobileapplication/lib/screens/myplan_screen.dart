import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repo/events_provider.dart';
import '../data/repo/pending_provider.dart';

class MyPlansScreen extends ConsumerStatefulWidget {
  MyPlansScreen({Key? key});

  @override
  ConsumerState<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends ConsumerState<MyPlansScreen> {
  //here i'm going to add a list of image url that I collected from the internet
  //you can use the image that you want, just copy and paste their Urls here inside the list

  //sometime we can face some http request erreur if the owner of the picture delted it or the url is not available
  @override
  Widget build(BuildContext context) {
    final PendingData = ref.watch(pendingDataProvider);
    final EventData = ref.watch(eventsDataProvider);
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        title: const Text('My Plans'),
        backgroundColor: Colors.black,
        // elevation: 0.0,
        // backgroundColor: Color(0xFFF6F7FF),
        // title: Row(
        //   children: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.menu,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ],
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Let's start by adding the text
            // Text(
            //   "Welcome Doctor Code",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 26.0,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            // Text(
            //   "Pick your destination",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 20.0,
            //     fontWeight: FontWeight.w300,
            //   ),
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // //Now let's add some elevation to our text field
            // //to do this we need to wrap it in a Material widget
            // Material(
            //   elevation: 10.0,
            //   borderRadius: BorderRadius.circular(30.0),
            //   shadowColor: Color(0x55434343),
            //   child: TextField(
            //     textAlign: TextAlign.start,
            //     textAlignVertical: TextAlignVertical.center,
            //     decoration: InputDecoration(
            //       hintText: "Search for Hotel, Flight...",
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: Colors.black54,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            SizedBox(height: 30.0),
            //Now let's Add a Tabulation bar
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.orange,
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Colors.orange,
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "My Plans for Places ",
                        ),
                        Tab(
                          text: "My Plans for Events",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          //Now let's create our first tab page
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Now let's add and test our first card
                                // travelCard(
                                //     urls[0], "Luxary Hotel", "Caroline", 3),
                                // travelCard(urls[5], "Plaza Hotel", "Italy", 4),
                                // travelCard(
                                //     urls[2], "Safari Hotel", "Africa", 5),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                // //Here you can add what ever you want
                                // travelCard(urls[6], "Visit Rome", "Italy", 4),
                                // travelCard(urls[8], "Visit Sidi bou Said",
                                //     "Tunsia", 4),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
