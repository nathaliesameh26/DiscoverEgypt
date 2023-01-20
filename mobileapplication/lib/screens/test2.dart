import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/place_data.dart';
import 'package:mobileapplication/model/place_model.dart';
import '../data/repo/places_provider.dart';

// String myDocId = 'place.uid';
// DocumentSnapshot? documentSnapshot;

class CrudPlace extends ConsumerStatefulWidget {
  CrudPlace({Key? key});

  @override
  ConsumerState<CrudPlace> createState() => _CrudPlaceState();
}

class _CrudPlaceState extends ConsumerState<CrudPlace> {
  @override
  Widget build(BuildContext context) {
    final placesData = ref.watch(placesDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('EgyMania Sightseeing Places'),
        backgroundColor: Color.fromARGB(255, 28, 128, 150),
      ),
      //value feha aldata , places data dy wakhda data mn alprovider
      body: placesData.when(
        data: (value) => SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.docs.length,
                    //count how many documents are in db and loops with the number of docs
                    itemBuilder: (BuildContext context, int index)
                        //to know in which im standing
                        {
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
                                      'Name: ${value.docs[index].get('name')}',
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
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 28, 128, 150),
                                            minimumSize: Size(150, 40)),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          "EDIT",
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              content: const Text(
                                                  "Are you sre you want to delete it?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                    // onPressed: () async {
                                                    //   deletePlace(
                                                    //       value.docs[index].get('name'));
                                                    // },
                                                  },
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 184, 195, 184),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("Yes"),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/placeList');
                                                  },
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 184, 195, 184),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("No"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(28, 128, 150, 1),
                                            minimumSize: Size(150, 40)),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          "Delete",
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
        //prints the error instead of red page error and loading when internet
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
