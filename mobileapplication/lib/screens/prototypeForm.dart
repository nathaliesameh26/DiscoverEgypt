import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class proto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return protoState();
  }
}

class protoState extends State<proto> {
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
        backgroundColor: Colors.transparent,
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Add A New Place',
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
          actions: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/personIco.jpg'),
            )
          ],
        ),
        body: Container(
            constraints: const BoxConstraints.expand(),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/cairov.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5),
                    BlendMode.modulate,
                  ),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              // physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(),
              child: Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.05),
                        Text('Add Place Name'),
                        TextFormField(
                            autofocus: false,
                            cursorColor: Color.fromARGB(255, 0, 0, 0),
                            controller: nameController,
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color.fromARGB(255, 17, 7, 56),
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Enter The place Name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp('[a-zA-Z]').hasMatch(value)) {
                                return "enter a correct place name";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            autofocus: false,
                            cursorColor: Color.fromARGB(255, 0, 0, 0),
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color.fromARGB(255, 17, 7, 56),
                            ),
                            controller: aboutController,
                            decoration: const InputDecoration(
                                labelText: "Enter the place's description"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp('[a-zA-Z]').hasMatch(value)) {
                                return "enter a correct description";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: closingTimeController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place's city "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp('[a-zA-Z]').hasMatch(value)) {
                                return "enter a correct city";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            autofocus: false,
                            cursorColor: Color.fromARGB(255, 0, 0, 0),
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color.fromARGB(255, 17, 7, 56),
                            ),
                            controller: locationController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place's location"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                                //alpanumeric validator
                                return "enter a correct location";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: height * 0.05),
                        TextFormField(
                            controller: closingTimeController,
                            decoration: const InputDecoration(
                                labelText: "Enter The place's Ticket Price "),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'\d').hasMatch(value)) {
                                return "enter a correct price";
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
                                  !RegExp(r'^(?:[+0]9?)?[0-9]{0,12}$')
                                      .hasMatch(value)) {
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
                                  !RegExp(r'^(?:[+0]9?)?[0-9]{0,12}$')
                                      .hasMatch(value)) {
                                return "enter a correct time";
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                              child: const Text('Submit Form'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            )));
    ;
  }
}

// DATE VALIDATOR : r'(\d{4}-?\d\d-?\d\d(\s|T)\d\d:?\d\d:?\d\d)'
