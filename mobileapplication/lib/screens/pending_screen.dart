import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobileapplication/model/place_model.dart';
import '../data/repo/places_provider.dart';

class PendingScreen extends ConsumerStatefulWidget {
  PendingScreen({Key? key});

  @override
  ConsumerState<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends ConsumerState<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    final PlacesData = ref.watch(placesDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Events'),
        backgroundColor: Colors.black,
      ),
      body: PlacesData.when(
          data: (value) => SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: 5,
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
                                            'Event ID: ${value.get('name')}"',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          //Text(
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${value.get('name')}',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 285,
                                                        child: Text(
                                                          '${value.get('about')}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                          overflow:
                                                              TextOverflow.clip,
                                                          maxLines: 4,
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
                                                '${value.get('location')}',
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
                                                '${value.get('price')}',
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
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.black,
                                                  minimumSize: Size(150, 40)),
                                              child: Text(
                                                "Accept",
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              )),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.black,
                                                  minimumSize: Size(150, 40)),
                                              child: Text(
                                                "Cancel",
                                                style: const TextStyle(
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
                    )
                  ],
                ),
              ),
          error: (Object error, StackTrace stackTrace) {},
          loading: () {}),
    );
  }
}
