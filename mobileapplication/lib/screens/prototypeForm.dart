import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileapplication/model/place_model.dart';

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
  TextEditingController cityController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();
  // TextEditingController ratingController = TextEditingController();
  // TextEditingController imageController = TextEditingController();

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
          backgroundColor: Color.fromARGB(255, 112, 86, 110),
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
        ),
        body: Container(
            constraints: const BoxConstraints.expand(),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/whiteee.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(1),
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
                        // SizedBox(height: 3),
                        // // ignore: prefer_const_constructors
                        // Text(
                        //   'Please enter the place details',
                        //   // ignore: prefer_const_constructors
                        //   style: TextStyle(
                        //     fontFamily: 'Raleway',
                        //     fontSize: 18,
                        //     color: Colors.black,
                        //     height: 5,
                        //   ),
                        // ),
                       SizedBox(height: height * 0.05),
                        TextFormField(
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            autofocus: false,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            controller: aboutController,
                            decoration: const InputDecoration(
                                labelText: "Enter the place's name"),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp('[a-zA-Z]').hasMatch(value)) {
                                return "enter a correct name";
                              } else {
                                return null;
                              }
                            }
                            ),

                        SizedBox(height: height * 0.05),
                        TextFormField(
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            autofocus: false,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.black,
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
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            autofocus: false,
                            cursorColor: Colors.black,
                            controller: cityController,
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
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            autofocus: false,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Colors.black,
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
                            controller: priceController,
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
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 112, 86, 110),
                              ),
                              onPressed: () async {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (formkey.currentState!.validate()) {
                                  await FirebaseFirestore.instance
                                      .collection('places')
                                      .add({
                                    'name': nameController.text,
                                    'about': aboutController.text,
                                    'price': priceController.text,
                                    'city': cityController.text,
                                    'location': locationController.text,
                                    'openingtime': openingTimeController.text,
                                    'closingtime': closingTimeController.text,
                                  });
                                  //  DatabaseService addplace = DatabaseService();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Successfully Added ')),
                                  );
                                  // Navigator.pushNamed(context, '/test');
                                  // FirebaseFirestore.instance
                                  //     .collection('places')
                                  //     .add({'text': 'data added through app'});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Something went Wrong R-enter your data ')),
                                  );
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
