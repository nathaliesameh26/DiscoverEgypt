import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repo/user_provider.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    error:
                                        (Object error, StackTrace stackTrace) {
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
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.person),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 28, 128, 150),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Logo.jpeg'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const SizedBox(height: 8),
                            const Text(
                              'Everyday is a new experience',
                              style: TextStyle(
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
                            color: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: Row(
                            children: [
                              // Image.asset('assets/detection.png', height: 30),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(context, '/test');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 28, 128, 150),
                                  ),
                                  child: const Text('Egypt sightseing places')),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: Row(
                            children: [
                              // Image.asset('assets/severity.png', height: 30),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 28, 128, 150),
                                  ),
                                  child: const Text('Egypt\'s Events')),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: Row(
                            children: [
                              // Image.asset('assets/online-survey.png', height: 30),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 28, 128, 150),
                                  ),
                                  child: const Text('Event Planners')),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: Row(
                            children: [
                              // Image.asset('assets/contact.png', height: 30),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 28, 128, 150),
                                  ),
                                  child: const Text('Users')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text('Places and Events',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edplace');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child:
                              const Text('Edit & Delete Sightseeing Places')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/edevent');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: const Text('Edit & Delete Events')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/pending');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: const Text('Events Pending List')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/eventform');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: const Text('Add An Events')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/addplace');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 28, 128, 150),
                          ),
                          child: const Text('Add A Sightseeing Place')),
                    ],
                  ),
                ),
                // )
              ],
            ),
          ),
        )));
  }
}

//elevatedbuttons in container? 


   // ignore: prefer_const_constructors
            // SizedBox(height: 25),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     // ignore: prefer_const_literals_to_create_immutables
            //     children: [
            //       // ignore: prefer_const_constructors
            //       Text('Places and Events',
            //           // ignore: prefer_const_constructors
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //           )),
            //       Text(
            //         'See all',
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.grey[500],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 25),
            // Expanded(
            //     child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 25.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.deepPurple[100],
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Column(
            //           children: [
            //             // Image.asset(
            //             //   'assets/doctor1.jpg',
            //             //   height: 40,
            //             // ),
            //             Row(
            //               // ignore: prefer_const_literals_to_create_immutables
            //               children: [
            //                 const Icon(Icons.star),
            //                 const Text('4'),
            //               ],
            //             ),
            //             const Text('Dr.Philip George'),
            //             const Text('6th of october , hospital '),
            //           ],
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 25.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.deepPurple[100],
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Column(
            //           children: [
            //             // Image.asset(
            //             //   'assets/doctor2.jpg',
            //             //   height: 40,
            //             // ),
            //             Row(
            //               // ignore: prefer_const_literals_to_create_immutables
            //               children: [
            //                 const Icon(Icons.star),
            //                 const Text('4'),
            //               ],
            //             ),
            //             const Text('Dr.Ahmed Marzoaa'),
            //             const Text('Alshrouq city , Swiss hospital '),
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ))

                // const SizedBox(height: 25),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Container(
                //     padding: const EdgeInsets.all(12),
                //     decoration: BoxDecoration(
                //       color: Colors.deepPurple[100],
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: const TextField(
                //       decoration: InputDecoration(
                //           prefixIcon: (Icon(Icons.search)),
                //           border: InputBorder.none,
                //           hintText: 'How can we help you?'),
                //     ),
                //   ),
                // ),







//  Container(
//                   height: 80,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       SizedBox(height: 24),
//                       MaterialButton(
//                         padding: EdgeInsets.symmetric(vertical: 4),
//                         onPressed: () {},
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                         child: Row(
//                           children: 
//                             [],
//                         ),
//                       ),

// Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   '1000',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   'Users',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ],
                              
//                             ),