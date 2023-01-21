import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileapplication/data/dataApp/place_data.dart';

class PlacesForm extends StatefulWidget {
  const PlacesForm({Key? key}) : super(key: key);

  @override
  State<PlacesForm> createState() => _PlacesFormState();
}

final formkey = GlobalKey<FormState>();
TimeOfDay time = TimeOfDay.now();

class _PlacesFormState extends State<PlacesForm> {
  final placeDAta = PlacesData();
  DateTime date = DateTime(2023, 1, 23);
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 199, 190, 199),
          elevation: 0,
          title: Text(
            'Add A New Sightseeing Place',
            style: Theme.of(context).textTheme.headline6,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/admin');
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Enter the place details please ',
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return "enter a correct name";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                controller: aboutController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place Description ',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return "enter a correct description";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                controller: cityController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place City',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return "enter a city";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                controller: locationController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place Location',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-zA-Z0-9]+$')
                                          .hasMatch(value)) {
                                    //alpanumeric validator
                                    return "enter a correct location";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                controller: priceController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place Price',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'\d').hasMatch(value)) {
                                    return "enter a correct price";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              controller: openingTimeController,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  suffixIcon:
                                      const Icon(Icons.access_alarm_sharp),
                                  labelText: "Enter Opening Time"),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: time,
                                );
                                if (newTime != null) {
                                  print(newTime);
                                  String formattedTime =
                                      newTime.format(context);
                                  print(formattedTime);
                                  setState(() {
                                    openingTimeController.text = formattedTime;
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              controller: closingTimeController,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  suffixIcon:
                                      const Icon(Icons.access_alarm_rounded),
                                  labelText: "Enter Closing Time"),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: time,
                                );
                                if (newTime != null) {
                                  print(newTime);
                                  String formattedTime =
                                      newTime.format(context);
                                  print(formattedTime);
                                  setState(() {
                                    closingTimeController.text = formattedTime;
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 199, 190, 199),
                                ),
                                child: const Text('Submit'),
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    await placeDAta.placeAdded(
                                      name: nameController.text,
                                      about: aboutController.text,
                                      city: cityController.text,
                                      price: priceController.text,
                                      openingTime: openingTimeController.text,
                                      closingTime: closingTimeController.text,
                                      location: locationController.text,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Successfully Added')),
                                    );
                                    Navigator.pushNamed(context, '/admin');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Something went Wrong R-enter your data')),
                                    );
                                  }
                                },
                              )),
                        ],
                      )))),
        ));
  }
}