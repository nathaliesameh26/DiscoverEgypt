import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:mobileapplication/data/repo/places_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class EditPlacePage extends StatefulWidget {
  @override
  _EditPlacePageState createState() => _EditPlacePageState();
}

class _EditPlacePageState extends State<EditPlacePage> {
  final _formKey = GlobalKey<FormState>();
  // late TextEditingController nameController ;
  // late TextEditingController aboutController;
  // late TextEditingController priceController;
  // late TextEditingController cityController;
  // late TextEditingController locationController;
  // late TextEditingController openingTimeController;
  // late TextEditingController closingTimeController;

  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //   void initState() {
    //   super.initState();
    //   final placeData = ref.read(placesDataProvider).value;
    //   aboutController = TextEditingController(text: placeData.get('name'));
    //   priceController =
    //       TextEditingController(text: placeData.get('price').toString());
    //   cityController = TextEditingController(text: placeData.get('city'));
    //   locationController = TextEditingController(text: placeData.get('location'));
    //   closingTimeController =
    //       TextEditingController(text: placeData.get('openingtime'));
    //   closingTimeController =
    //       TextEditingController(text: placeData.get('closingtime'));
    // }
    return Scaffold(
         appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 103, 58, 209),
          elevation: 0,
          title: Text(
            'Update Place',
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
        body: Form(
          child: SingleChildScrollView(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: aboutController,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(
                        labelText: 'Price',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                        labelText: 'Location',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter a location';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                        labelText: 'City',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter a city';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: openingTimeController,
                    decoration: InputDecoration(
                        labelText: 'Opening Time',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter an opening time';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: closingTimeController,
                    decoration: InputDecoration(
                        labelText: 'Closing Time',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter a closing time';
                    //   }
                    //   return null;
                    // },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState!.save();
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Successfully Added')),
                        //   );
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //         content: Text(
                        //             'Something went Wrong R-enter your data ')),
                        //   );
                        // }
                      },
                      child: const Text('Place Updated'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
