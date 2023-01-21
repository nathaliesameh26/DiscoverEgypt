import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobileapplication/model/place_model.dart';
import '../data/repo/events_provider.dart';
import '../data/repo/myplans_provider.dart';
import '../data/repo/pending_provider.dart';
import '../data/repo/places_provider.dart';
import '../data/repo/wishlist_provider.dart';

// class WishlistScreen extends ConsumerStatefulWidget {
//   WishlistScreen({Key? key});

//   @override
//   ConsumerState<WishlistScreen> createState() => _WishlistScreenState();
// }

// class _WishlistScreenState extends ConsumerState<WishlistScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final PendingData = ref.watch(pendingDataProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wishlist'),
//         backgroundColor: Colors.black,
//       ),
//       body: PendingData.when(
//           data: (value) => SafeArea(
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                           itemCount: value.docs.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 10.0, right: 10.0, top: 10.0),
//                               child: Card(
//                                 margin: EdgeInsets.zero,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         // ignore: prefer_const_literals_to_create_immutables
//                                         children: [
//                                           // Text(
//                                           //   ' ${value.docs[index].get('name')}',
//                                           //   style: const TextStyle(
//                                           //     fontSize: 16,
//                                           //     fontWeight: FontWeight.bold,
//                                           //   ),
//                                           // ),
//                                           // Text(
//                                           //   DateFormat('dd-MM-yy').format(order.createdAt),
//                                           //   'Event ID: ${value.get('name')}"',
//                                           //   style: const TextStyle(
//                                           //     fontSize: 16,
//                                           //     fontWeight: FontWeight.bold,
//                                           //   ),
//                                           // ),
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 10.0,
//                                       ),
//                                       ListView.builder(
//                                           shrinkWrap: true,
//                                           physics:
//                                               const NeverScrollableScrollPhysics(),
//                                           itemCount: 1,
//                                           itemBuilder: (BuildContext context,
//                                               int index) {
//                                             return Padding(
//                                               padding: const EdgeInsets.only(
//                                                   bottom: 10.0),
//                                               child: Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     height: 50,
//                                                     width: 50,
//                                                     child: Image.asset(
//                                                       'assets/Egypt.jpg',
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Text(
//                                                         '${value.docs[index].get('name')}',
//                                                         style: const TextStyle(
//                                                           fontSize: 14,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       SizedBox(
//                                                         width: 285,
//                                                         child: Text(
//                                                           '${value.docs[index].get('about')}',
//                                                           style:
//                                                               const TextStyle(
//                                                             fontSize: 14,
//                                                           ),
//                                                           overflow:
//                                                               TextOverflow.clip,
//                                                           maxLines: 5,
//                                                         ),
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             );
//                                           }),
//                                       const SizedBox(
//                                         height: 10.0,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Column(
//                                             children: [
//                                               // ignore: prefer_const_constructors
//                                               Text(
//                                                 'Location:',
//                                                 style: const TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 height: 10,
//                                               ),
//                                               Text(
//                                                 '${value.docs[index].get('location')}',
//                                                 style: const TextStyle(
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Column(
//                                             children: [
//                                               // ignore: prefer_const_constructors
//                                               Text(
//                                                 'Price:',
//                                                 style: const TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 height: 10,
//                                               ),
//                                               Text(
//                                                 '${value.docs[index].get('price')}',
//                                                 style: const TextStyle(
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                       const SizedBox(
//                                         height: 10.0,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           ElevatedButton.icon(
//                                               icon: const Icon(
//                                                   Icons.view_carousel),
//                                               onPressed: () {},
//                                               style: ElevatedButton.styleFrom(
//                                                   backgroundColor: Colors.black,
//                                                   minimumSize: Size(150, 40)),
//                                               label: const Text(
//                                                 "View Details",
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                 ),
//                                               )),
//                                           ElevatedButton.icon(
//                                               icon: const Icon(Icons.delete),
//                                               onPressed: () {},
//                                               style: ElevatedButton.styleFrom(
//                                                   backgroundColor: Colors.black,
//                                                   minimumSize:
//                                                       const Size(150, 40)),
//                                               label: const Text(
//                                                 "Remove",
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                 ),
//                                               )),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }),
//                     )
//                   ],
//                 ),
//               ),
//           error: (Object error, StackTrace stackTrace) {},
//           loading: () {}),
//     );
//   }
// }

class WishlistScreen extends ConsumerStatefulWidget {
  WishlistScreen({Key? key});

  @override
  ConsumerState<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends ConsumerState<WishlistScreen> {
  //here i'm going to add a list of image url that I collected from the internet
  //you can use the image that you want, just copy and paste their Urls here inside the list

  //sometime we can face some http request erreur if the owner of the picture delted it or the url is not available
  @override
  Widget build(BuildContext context) {
    final PlacesData = ref.watch(placesDataProvider);
    final MyPlansData = ref.watch(plansDataProvider);
    final EventData = ref.watch(eventsDataProvider);
    final wl = ref.watch(wishlistDataProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FF),
      appBar: AppBar(
        title: const Text('My Wishlist'),
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
            const SizedBox(height: 30.0),
            //Now let's Add a Tabulation bar
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: Colors.orange,
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Colors.orange,
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "My Favorite Places ",
                        ),
                        Tab(
                          text: "My Favorite Events",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PlacesData.when(
                      data: (value) => SafeArea(
                        child: Container(
                          height: 500.0,
                          child: TabBarView(
                            children: [
                              //Now let's create our first tab page
                              Container(
                                child: ListView.builder(
                                    itemCount: value.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0, top: 10.0),
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${value.docs[index].get('name')}',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   DateFormat('dd-MM-yy').format(order.createdAt),
                                                    //   'Event ID: ${value.get('name')}"',
                                                    //   style: const TextStyle(
                                                    //     fontSize: 16,
                                                    //     fontWeight: FontWeight.bold,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 10.0),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child:
                                                                  Image.asset(
                                                                'assets/Egypt.jpg',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // Text(
                                                                //   '${value.docs[index].get('name')}',
                                                                //   style:
                                                                //       const TextStyle(
                                                                //     fontSize:
                                                                //         14,
                                                                //     fontWeight:
                                                                //         FontWeight
                                                                //             .bold,
                                                                //   ),
                                                                // ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${value.docs[index].get('location')}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    maxLines: 5,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        // ignore: prefer_const_constructors
                                                        Text(
                                                          'Location:',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '${value.docs[index].get('location')}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        // ignore: prefer_const_constructors
                                                        Text(
                                                          'Price:',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '${value.docs[index].get('price')} LE',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {},
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  minimumSize:
                                                                      Size(150,
                                                                          40)),
                                                          child: const Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          )),
                                                      //     ElevatedButton(
                                                      //         onPressed: () {},
                                                      //         style: ElevatedButton
                                                      //             .styleFrom(
                                                      //                 backgroundColor:
                                                      //                     Colors
                                                      //                         .black,
                                                      //                 minimumSize:
                                                      //                     Size(150,
                                                      //                         40)),
                                                      //         child: const Text(
                                                      //           "Cancel",
                                                      //           style: TextStyle(
                                                      //             fontSize: 12,
                                                      //           ),
                                                      //         )),
                                                      //   ],
                                                    ])
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              EventData.when(
                                data: (value) => SafeArea(
                                  child: Container(
                                    child: ListView.builder(
                                        itemCount: value.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 10.0),
                                            child: Card(
                                              margin: EdgeInsets.zero,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${value.docs[index].get('name')}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        // Text(
                                                        //   DateFormat('dd-MM-yy').format(order.createdAt),
                                                        //   'Event ID: ${value.get('name')}"',
                                                        //   style: const TextStyle(
                                                        //     fontSize: 16,
                                                        //     fontWeight: FontWeight.bold,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount: 1,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        10.0),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  height: 30,
                                                                  width: 30,
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/Egypt.jpg',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    // Text(
                                                                    //   '${value.docs[index].get('name')}',
                                                                    //   style:
                                                                    //       const TextStyle(
                                                                    //     fontSize:
                                                                    //         14,
                                                                    //     fontWeight:
                                                                    //         FontWeight
                                                                    //             .bold,
                                                                    //   ),
                                                                    // ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          Text(
                                                                        '${value.docs[index].get('city')}',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                        maxLines:
                                                                            5,
                                                                      ),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            // ignore: prefer_const_constructors
                                                            Text(
                                                              'Location:',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              '${value.docs[index].get('location')}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            // ignore: prefer_const_constructors
                                                            Text(
                                                              'Price:',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              '${value.docs[index].get('price')} LE',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    // Row(
                                                    //   mainAxisAlignment:
                                                    //       MainAxisAlignment
                                                    //           .spaceAround,
                                                    //   children: [
                                                    //     ElevatedButton(
                                                    //         onPressed: () {},
                                                    //         style: ElevatedButton
                                                    //             .styleFrom(
                                                    //                 backgroundColor:
                                                    //                     Colors
                                                    //                         .black,
                                                    //                 minimumSize:
                                                    //                     Size(150,
                                                    //                         40)),
                                                    //         child: const Text(
                                                    //           "Accept",
                                                    //           style: TextStyle(
                                                    //             fontSize: 12,
                                                    //           ),
                                                    //         )),
                                                    //     ElevatedButton(
                                                    //         onPressed: () {},
                                                    //         style: ElevatedButton
                                                    //             .styleFrom(
                                                    //                 backgroundColor:
                                                    //                     Colors
                                                    //                         .black,
                                                    //                 minimumSize:
                                                    //                     Size(150,
                                                    //                         40)),
                                                    //         child: const Text(
                                                    //           "Cancel",
                                                    //           style: TextStyle(
                                                    //             fontSize: 12,
                                                    //           ),
                                                    //         )),
                                                    //   ],
                                                    // )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                                error: (Object error, StackTrace err) {
                                  return const Text("Error loading your plans");
                                },
                                loading: () {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                                // Container(
                                //   child: ListView(
                                //     scrollDirection: Axis.horizontal,
                                //     children: [],
                                //   ),
                                // ),
                              )
                            ],
                          ),
                        ),
                      ),
                      error: (Object error, StackTrace err) {
                        return const Text("Error loading your plans");
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                    )
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
