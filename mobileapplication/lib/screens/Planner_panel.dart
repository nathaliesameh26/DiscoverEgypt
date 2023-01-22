import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileapplication/screens/edit_delete_events.dart';

import '../data/repo/events_provider.dart';
import '../widget/NumbersWidget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repo/user_provider.dart';
import 'edit_Event.dart';
import 'edit_event_planner.dart';

class PlannerPanel extends ConsumerStatefulWidget {
  PlannerPanel({Key? key});

  @override
  ConsumerState<PlannerPanel> createState() => _PlannerPanelState();
}

class _PlannerPanelState extends ConsumerState<PlannerPanel> {
  @override
  Widget build(BuildContext context) {
    final getEvents = ref.watch(SpecificEventProvider);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Hello,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Consumer(
                          builder: (_, ref, __) {
                            return ref.watch(userDataProvider).when(
                              data: (value) {
                                return Center(
                                  child: Text(
                                    // ignore: prefer_adjacent_string_concatenation
                                    '${value.get('firstname')}' +
                                        ' ' +
                                        '${value.get('lastname')}',

                                    style: const TextStyle(fontSize: 10),
                                  ),
                                );
                              },
                              error: (Object error, StackTrace stackTrace) {
                                return const Text(
                                  'User',
                                  style: TextStyle(fontSize: 20),
                                );
                              },
                              loading: () {
                                return const CircularProgressIndicator();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SizedBox(height: 15),
                    Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Logo.jpeg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        )),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Ready to explore new places?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text('Get Started'),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue[600],
                      ),
                    ),
                  ),
                  Center(
                    widthFactor: 2.5,
                    child: Container(
                      height: 100,
                      child: ElevatedButton(
                          child: Text("Add your Event",
                              style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.blue)))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/addedeventplanner');
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text('My Events:',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  ElevatedButton(
                      child: Text("View All ", style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.blue)))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/PlannerEvents');
                      }),
                ],
              ),
            ),
            const SizedBox(height: 10),
            getEvents.when(
              data: (value) => SafeArea(
                  child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${value.docs[index].get('name')}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                'assets/Egypt.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${value.docs[index].get('name')}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: 285,
                                                  child: Text(
                                                    '${value.docs[index].get('about')}',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    overflow: TextOverflow.clip,
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          'Location:',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${value.docs[index].get('location')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          'Price:',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${value.docs[index].get('price')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditEventPlanner(
                                                        value.docs[index])),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            minimumSize: Size(150, 40)),
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          CrudEvent();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            minimumSize: Size(150, 40)),
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )),
              error: (Object error, StackTrace err) {
                return const Text("Error loading your list");
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ]),
        ),
      ),
    );
  }
}
                
                
                
                
                
                
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../data/repo/user_provider.dart';

// class PlannerPanel extends StatefulWidget {
//   const PlannerPanel({super.key});

//   @override
//   State<PlannerPanel> createState() => _PlannerPanelState();
// }

// class _PlannerPanelState extends State<PlannerPanel> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//           child: SizedBox(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 // ignore: prefer_const_literals_to_create_immutables
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 17.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'Hello,',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Consumer(
//                               builder: (_, ref, __) {
//                                 return ref.watch(userDataProvider).when(
//                                   data: (value) {
//                                     return Center(
//                                       child: Text(
//                                         // ignore: prefer_adjacent_string_concatenation
//                                         '${value.get('firstname')}' +
//                                             ' ' +
//                                             '${value.get('lastname')}',

//                                         style: const TextStyle(fontSize: 10),
//                                       ),
//                                     );
//                                   },
//                                   error: (Object error, StackTrace stackTrace) {
//                                     return const Text(
//                                       'User',
//                                       style: TextStyle(fontSize: 20),
//                                     );
//                                   },
//                                   loading: () {
//                                     return const CircularProgressIndicator();
//                                   },
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.deepPurple[100],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: const Icon(Icons.person),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 28, 128, 150),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 100,
//                         width: 100,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/Logo.jpeg'),
//                             fit: BoxFit.fill,
//                           ),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Expanded(
//                           child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           const SizedBox(height: 8),
//                           const Text(
//                             'Everyday is a new experience',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: const Center(
//                               child: Text('Get Started'),
//                             ),
//                           )
//                         ],
//                       ))
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 25),
//               Container(
//                 height: 80,
//                 child: ListView(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 25.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Color.fromARGB(255, 28, 128, 150),
//                         ),
//                         child: Row(
//                           children: [
//                             // Image.asset('assets/detection.png', height: 30),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             ElevatedButton(
//                                 onPressed: () {
//                                   // Navigator.pushNamed(context, '/test');
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor:
//                                       Color.fromARGB(255, 28, 128, 150),
//                                 ),
//                                 child: const Text('Egypt sightseing places')),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 25.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Color.fromARGB(255, 28, 128, 150),
//                         ),
//                         child: Row(
//                           children: [
//                             // Image.asset('assets/severity.png', height: 30),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor:
//                                       Color.fromARGB(255, 28, 128, 150),
//                                 ),
//                                 child: const Text('Egypt\'s Events')),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 25.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Color.fromARGB(255, 28, 128, 150),
//                         ),
//                         child: Row(
//                           children: [
//                             // Image.asset('assets/online-survey.png', height: 30),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor:
//                                       Color.fromARGB(255, 28, 128, 150),
//                                 ),
//                                 child: const Text('Event Planners')),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 25.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Color.fromARGB(255, 28, 128, 150),
//                         ),
//                         child: Row(
//                           children: [
//                             // Image.asset('assets/contact.png', height: 30),
//                             // ignore: prefer_const_constructors
//                             SizedBox(
//                               width: 10,
//                             ),
//                             ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor:
//                                       Color.fromARGB(255, 28, 128, 150),
//                                 ),
//                                 child: const Text('Users')),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 25),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // ignore: prefer_const_literals_to_create_immutables
//                   children: [
//                     // ignore: prefer_const_constructors
//                     Text('Places and Events',
//                         // ignore: prefer_const_constructors
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         )),
//                   ],
//                 ),
//               ),

//               // ignore: prefer_const_constructors
//               SizedBox(height: 25),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // ignore: prefer_const_literals_to_create_immutables
//                   children: [
//                     // ignore: prefer_const_constructors
//                     Text('Places and Events',
//                         // ignore: prefer_const_constructors
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         )),
//                     Text(
//                       'See all',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[500],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Expanded(
//                   child: ListView(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.deepPurple[100],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         children: [
//                           // Image.asset(
//                           //   'assets/doctor1.jpg',
//                           //   height: 40,
//                           // ),
//                           Row(
//                             // ignore: prefer_const_literals_to_create_immutables
//                             children: [
//                               const Icon(Icons.star),
//                               const Text('4'),
//                             ],
//                           ),
//                           const Text('Dr.Philip George'),
//                           const Text('6th of october , hospital '),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.deepPurple[100],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         children: [
//                           // Image.asset(
//                           //   'assets/doctor2.jpg',
//                           //   height: 40,
//                           // ),
//                           Row(
//                             // ignore: prefer_const_literals_to_create_immutables
//                             children: [
//                               const Icon(Icons.star),
//                               const Text('4'),
//                             ],
//                           ),
//                           const Text('Dr.Ahmed Marzoaa'),
//                           const Text('Alshrouq city , Swiss hospital '),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ))
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

// //elevatedbuttons in container?

//    // ignore: prefer_const_constructors
//             // SizedBox(height: 25),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     // ignore: prefer_const_literals_to_create_immutables
//             //     children: [
//             //       // ignore: prefer_const_constructors
//             //       Text('Places and Events',
//             //           // ignore: prefer_const_constructors
//             //           style: TextStyle(
//             //             fontWeight: FontWeight.bold,
//             //             fontSize: 20,
//             //           )),
//             //       Text(
//             //         'See all',
//             //         style: TextStyle(
//             //           fontSize: 16,
//             //           fontWeight: FontWeight.bold,
//             //           color: Colors.grey[500],
//             //         ),
//             //       )
//             //     ],
//             //   ),
//             // ),
//             // const SizedBox(height: 25),
//             // Expanded(
//             //     child: ListView(
//             //   scrollDirection: Axis.horizontal,
//             //   children: [
//             //     Padding(
//             //       padding: const EdgeInsets.only(left: 25.0),
//             //       child: Container(
//             //         decoration: BoxDecoration(
//             //           color: Colors.deepPurple[100],
//             //           borderRadius: BorderRadius.circular(12),
//             //         ),
//             //         child: Column(
//             //           children: [
//             //             // Image.asset(
//             //             //   'assets/doctor1.jpg',
//             //             //   height: 40,
//             //             // ),
//             //             Row(
//             //               // ignore: prefer_const_literals_to_create_immutables
//             //               children: [
//             //                 const Icon(Icons.star),
//             //                 const Text('4'),
//             //               ],
//             //             ),
//             //             const Text('Dr.Philip George'),
//             //             const Text('6th of october , hospital '),
//             //           ],
//             //         ),
//             //       ),
//             //     ),
//             //     Padding(
//             //       padding: const EdgeInsets.only(left: 25.0),
//             //       child: Container(
//             //         decoration: BoxDecoration(
//             //           color: Colors.deepPurple[100],
//             //           borderRadius: BorderRadius.circular(12),
//             //         ),
//             //         child: Column(
//             //           children: [
//             //             // Image.asset(
//             //             //   'assets/doctor2.jpg',
//             //             //   height: 40,
//             //             // ),
//             //             Row(
//             //               // ignore: prefer_const_literals_to_create_immutables
//             //               children: [
//             //                 const Icon(Icons.star),
//             //                 const Text('4'),
//             //               ],
//             //             ),
//             //             const Text('Dr.Ahmed Marzoaa'),
//             //             const Text('Alshrouq city , Swiss hospital '),
//             //           ],
//             //         ),
//             //       ),
//             //     )
//             //   ],
//             // ))

//                 // const SizedBox(height: 25),
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 //   child: Container(
//                 //     padding: const EdgeInsets.all(12),
//                 //     decoration: BoxDecoration(
//                 //       color: Colors.deepPurple[100],
//                 //       borderRadius: BorderRadius.circular(12),
//                 //     ),
//                 //     child: const TextField(
//                 //       decoration: InputDecoration(
//                 //           prefixIcon: (Icon(Icons.search)),
//                 //           border: InputBorder.none,
//                 //           hintText: 'How can we help you?'),
//                 //     ),
//                 //   ),
//                 // ),

// //  Container(
// //                   height: 80,
// //                   child: ListView(
// //                     scrollDirection: Axis.horizontal,
// //                     children: [
// //                       SizedBox(height: 24),
// //                       MaterialButton(
// //                         padding: EdgeInsets.symmetric(vertical: 4),
// //                         onPressed: () {},
// //                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// //                         child: Row(
// //                           children:
// //                             [],
// //                         ),
// //                       ),

// // Column(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               children: <Widget>[
// //                                 Text(
// //                                   '1000',
// //                                   style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 20,
// //                                   ),
// //                                 ),
// //                                 SizedBox(height: 2),
// //                                 Text(
// //                                   'Users',
// //                                   style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 20,
// //                                   ),
// //                                 ),
// //                               ],

// //                             ),