import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/events_data.dart';
import 'package:mobileapplication/data/dataApp/pending_data.dart';
import '../data/repo/pending_provider.dart';

class PendingScreen extends ConsumerStatefulWidget {
  PendingScreen({Key? key});

  @override
  ConsumerState<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends ConsumerState<PendingScreen> {
  final eventData = PendingData();
  final addevent = EventsData();
  @override
  Widget build(BuildContext context) {
    final PendingData = ref.watch(pendingDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Events'),
        backgroundColor: Colors.blue,
      ),
      body: PendingData.when(
        data: (value) => SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.docs.length,
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
                                      'Event Name : ${value.docs[index].get('name')}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
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
                                  ),
                                ),
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
                                        const SizedBox(height: 5),
                                        Text(
                                          'City :${value.docs[index].get('city')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Location : ${value.docs[index].get('location')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Planner Name:${value.docs[index].get('plannerName')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Price : ${value.docs[index].get('price')}',
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

                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Opening Time: ${value.docs[index].get('openingTime')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Closing Time : ${value.docs[index].get('closingTime')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Start Date: ${value.docs[index].get('startdate')}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'End Date : ${value.docs[index].get('enddate')}',
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
                                        onPressed: () async {
                                          // await
                                          eventData.deletePendingEvent(
                                              id: value.docs[index].id);

                                          await eventData.pendingEventAdded(
                                            name: value.docs[index].get('name'),
                                            about:
                                                value.docs[index].get('about'),
                                            city: value.docs[index].get('city'),
                                            plannerName: value.docs[index]
                                                .get('plannerName'),
                                            price:
                                                value.docs[index].get('price'),
                                            openingTime: value.docs[index]
                                                .get('openingTime'),
                                            closingTime: value.docs[index]
                                                .get('closingTime'),
                                            startdate: value.docs[index]
                                                .get('startdate'),
                                            enddate: value.docs[index]
                                                .get('enddate'),
                                            location: value.docs[index]
                                                .get('location'),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            minimumSize: Size(150, 40)),
                                        child: const Text(
                                          "Accept",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                    ElevatedButton(
                                        onPressed: () async {
                                          await eventData.deletePendingEvent(
                                              id: value.docs[index].id);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            minimumSize: Size(150, 40)),
                                        child: const Text(
                                          "Decline",
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
              )
            ],
          ),
        ),
        error: (Object error, StackTrace err) {
          return const Text("Error loading your list");
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


//in the decline add the delete function and in the accept add the delete from pending and add function to  events