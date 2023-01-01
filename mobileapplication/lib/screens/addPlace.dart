import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class placeform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return placeformState();
  }
}

class placeformState extends State<placeform> {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 10,
          title: const Text("Add A Sightseeing Place"),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/temple.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5),
                    BlendMode.modulate,
                  ),
                  fit: BoxFit.fitHeight),
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(),
              child: Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.04),
                        const Text("Add Your Event Details",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(15, 255, 255, 255))),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place Name"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
                                return "enter a correct place name";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: aboutController,
                            decoration: const InputDecoration(
                                labelText: "Enter the place's description"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
                                return "enter a correct description";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: locationController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place's location"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return "enter a correct location";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: openingTimeController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place's opening time "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z]+|\s').hasMatch(value)) {
                                return "enter a correct time";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: closingTimeController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place's closing time "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z]+|\s').hasMatch(value)) {
                                return "enter a correct time";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: ratingController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place's rating "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z]+|\s').hasMatch(value)) {
                                return "enter a correct rating";
                              } else {
                                return null;
                              }
                            }),
                        ElevatedButton(
                          onPressed: () async {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (formkey.currentState!.validate()) {
                              //DatabaseService service = DatabaseService();
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text('Processing Data')),
                              // );
                              FirebaseFirestore.instance
                                  .collection('places')
                                  .add({'text': 'data added through app'});
                            }
                          },
                          child: const Text('Add place'),
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
