import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobileapplication/data/dataApp/place_data.dart';

class EditPlacePage extends ConsumerStatefulWidget {
  final DocumentSnapshot document;
  EditPlacePage(this.document);
  @override
  ConsumerState<EditPlacePage> createState() => _EditPlacePageState();
}

class _EditPlacePageState extends ConsumerState<EditPlacePage> {
  final _formKey = GlobalKey<FormState>();
  final dataPlace = PlacesData();

  late TextEditingController nameController;
  late TextEditingController aboutController;
  late TextEditingController priceController;
  late TextEditingController cityController;
  late TextEditingController locationController;
  late TextEditingController openingTimeController;
  late TextEditingController closingTimeController;
  late String id;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.document.get('name'));
    aboutController = TextEditingController(text: widget.document.get('about'));
    priceController =
        TextEditingController(text: widget.document.get('price').toString());
    cityController = TextEditingController(text: widget.document.get('city'));
    locationController =
        TextEditingController(text: widget.document.get('location'));
    openingTimeController =
        TextEditingController(text: widget.document.get('openingTime'));
    closingTimeController =
        TextEditingController(text: widget.document.get('closingTime'));
    id = widget.document.id;
    //use widget. cuz its a stateful widget and document is a parameter for the stateful widget itself use it for
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
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
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    // ignore: prefer_const_constructors
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
                    // ignore: prefer_const_constructors
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
                    // ignore: prefer_const_constructors
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
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        labelText: 'Location',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: cityController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        labelText: 'City',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: openingTimeController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        labelText: 'Opening Time',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: closingTimeController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        labelText: 'Closing Time',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          dataPlace.updatePlaceDetails(
                            id,
                            nameController.text,
                            aboutController.text,
                            cityController.text,
                            priceController.text,
                            locationController.text,
                            openingTimeController.text,
                            closingTimeController.text,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Successfully Updated')),
                          );

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Something went Wrong R-enter your data')),
                          );
                        }
                      },
                      child: const Text('Update Place'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
