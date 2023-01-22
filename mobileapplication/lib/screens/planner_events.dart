import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/events_data.dart';
import '../data/repo/events_provider.dart';
import '../data/repo/pending_provider.dart';
import 'edit_delete_events.dart';
import 'edit_event_planner.dart';

class PlannerEvents extends ConsumerStatefulWidget {
  PlannerEvents({Key? key});

  @override
  ConsumerState<PlannerEvents> createState() => _PlannerEventState();
}

class _PlannerEventState extends ConsumerState<PlannerEvents> {
  final eventdataa = EventsData();
  @override
  Widget build(BuildContext context) {
    final getEvents = ref.watch(SpecificEventProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your added event'),
          backgroundColor: Colors.blue,
        ),
        body: getEvents.when(
          data: (value) => SafeArea(
              child: Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      '${value.docs[index].get('price')} LE',
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    onPressed: () async {
                                      await eventdataa.deleteEvent(
                                          id: value.docs[index].id);
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
        ));
  }
}


//in the decline add the delete function and in the accept add the delete from pending and add function to  events