import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/model/place_model.dart';
import '../data/repo/places_provider.dart';

class DetailSreen extends ConsumerStatefulWidget {
  const DetailSreen({super.key});

  //final PlaceInfo placeInfo;
  //const DetailSreen({super.key, required this.placeInfo});

  @override
  ConsumerState<DetailSreen> createState() => _DetailSreenState();
}

class _DetailSreenState extends ConsumerState<DetailSreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final PlacesData = ref.watch(placesDataProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Row(
            //children: [Image.asset(name)],
            ),
        body: PlacesData.when(
          data: (value) => SafeArea(
            child: Stack(
              children: [
                // Image.asset(
                //   //widget.placeInfo.image,
                //   //width: double.infinity,
                //   //fit: BoxFit.cover,
                //   //height: MediaQuery.of(context).size.height * 0.6,
                // ),
                SafeArea(
                  child: Column(
                    children: [
                      //appbar buttons
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(100),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      4.0), //dec thikness of the rounded button
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(100),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    4.0), //dec thikness of the rounded button
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.bookmark_rounded,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${value.get('name')}",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.blue,
                                      ),
                                      Text("${value.get('location')}",
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18,
                                            //fontWeight: FontWeight.bold
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text("Place Details",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text("${value.get('about')}",
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 19,
                                        //fontWeight: FontWeight.bold
                                      )),
                                  const Divider(
                                    height: 5,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("Time:",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child:
                                            Text("${value.get('openingtime')}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  //fontWeight: FontWeight.bold
                                                )),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text("Price:",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text("${value.get('price')} LE",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              //fontWeight: FontWeight.bold
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 28,
                                  ),
                                  MaterialButton(
                                    color: Colors.blue,
                                    minWidth: double.infinity,
                                    height: 55,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    onPressed: () {},
                                    child: const Text(
                                      "Book",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          error: (Object error, StackTrace stackTrace) {},
          loading: () {},
        ));
  }
}
