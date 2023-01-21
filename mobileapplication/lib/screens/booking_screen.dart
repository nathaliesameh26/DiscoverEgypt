import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/login_data.dart';
import 'package:mobileapplication/data/dataApp/myplans_data.dart';
import 'package:mobileapplication/data/dataApp/place_data_test.dart';
import 'package:mobileapplication/data/repo/pending_provider.dart';

import '../data/repo/places_provider.dart';

class BookingScreen extends ConsumerStatefulWidget {
  BookingScreen({Key? key});

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final PlacesData = ref.watch(placesDataProvider);
    final plans = Plans();
    final i = ModalRoute.of(context)!.settings.arguments;
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    // TextEditingController location = TextEditingController();
    // TextEditingController price = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Booking'),
          backgroundColor: Colors.black,
        ),
        body: Card(
            child: PlacesData.when(
          data: (value) => SafeArea(
              child: Column(children: [
            Expanded(
                // child: ListView.builder(
                //     itemCount: 1,
                //     //value.docs.length
                //     itemBuilder: (BuildContext context, int index) {
                //       return
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0),
                    child: Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Event ID: ${value.docs[i].get('name')}',
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
                                              '${value.docs[i].get('name')}',
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
                                                '${value.docs[i].get('about')}',
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
                                      '${value.docs[i].get('location')} , Egypt',
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
                                      '${value.docs[i].get('price')} LE',
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
                            Column(
                              children: [
                                const SizedBox(height: 10.0),
                                const Text("Enter Your Name",
                                    //mafrod akhod el esm mn el login 3ashan myktbossh tany
                                    style: TextStyle(
                                        fontSize: 30,
                                        color:
                                            Color.fromARGB(15, 255, 255, 255))),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                    controller: name,
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black),
                                        ),
                                        labelText: "Enter you name here"),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'[a-z A-Z]*$')
                                              .hasMatch(value)) {
                                        return "enter a correct place name";
                                      } else {
                                        return null;
                                      }
                                    }),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: email,
                                  style: TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    labelText: "Enter your email here",
                                    //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                      return "Enter the email correctly";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: phone,
                                  // onChanged:(value){
                                  //   phone = value;
                                  // },
                                  style: TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black),
                                    ),
                                    labelText: "Enter your phone number",
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter the phone number";
                                    } else if (value.length != 11) {
                                      return "The phone number isn't correct";
                                    } else if (!RegExp(r"^[1-10]+")
                                        .hasMatch(value)) {
                                      return "The phone number don't have to include characters or /%^";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        plans.addMyPlans(
                                          email.text,
                                          name.text,
                                          phone.text,
                                          userId,
                                          value.docs[i].get('id'),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                          minimumSize: Size(150, 40)),
                                      child: Text(
                                        "Book",
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ))
                                ])
                          ]),
                        ))))
          ])),
          error: (Object error, StackTrace err) {
            return const Text("Error loading your list");
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        )));
  }
}
