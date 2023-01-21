import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repo/pending_provider.dart';

class PendingScreen extends ConsumerStatefulWidget {
  PendingScreen({Key? key});

  @override
  ConsumerState<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends ConsumerState<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    final PendingData = ref.watch(pendingDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Events'),
        backgroundColor: Colors.black,
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
                                      'Event ID: ${value.docs[index].get('name')}',
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
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            minimumSize: Size(150, 40)),
                                        child: const Text(
                                          "Accept",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            minimumSize: Size(150, 40)),
                                        child: const Text(
                                          "Cancel",
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