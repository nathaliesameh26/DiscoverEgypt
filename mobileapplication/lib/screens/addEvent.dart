import 'package:flutter/material.dart';

class Eventform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EPformState();
  }
}

class EPformState extends State<Eventform> {
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
          title: const Text("Add your event"),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/temple.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.9),
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
                                color: Color.fromARGB(15, 0, 0, 0))),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                labelText: "Enter The Event Name"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
                                return "enter a correct name";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Enter thr Event's description"),
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
                            decoration: const InputDecoration(
                                labelText: "Enter The Event's location"),
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
                            decoration: const InputDecoration(
                                labelText: "Enter The Event's start date "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$')
                                      .hasMatch(value)) {
                                return "enter a correct date";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Enter The Event's end date "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$')
                                      .hasMatch(value)) {
                                return "enter a correct date";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Enter The Event's opening time "),
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
                            decoration: const InputDecoration(
                                labelText: "Enter The Event's closing time "),
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
                            decoration: const InputDecoration(
                                labelText: "Enter The Leader's Name "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
                                return "enter a correct Leader Name";
                              } else {
                                return null;
                              }
                            }),
                        ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (formkey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
