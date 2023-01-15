import 'package:flutter/material.dart';
import 'package:mobileapplication/model/place_model.dart';

class placeForm extends StatefulWidget {
  const placeForm({Key? key}) : super(key: key);

  @override
  State<placeForm> createState() => _placeFormState();
}

final formkey = GlobalKey<FormState>();

class _placeFormState extends State<placeForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
 TextEditingController locationController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 199, 190, 199),
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
                          // Container(
                          //   padding: const EdgeInsets.all(10),
                          //   child: TextFormField(
                          //       controller: locationController,
                          //       decoration: const InputDecoration(
                          //         border: OutlineInputBorder(),
                          //         labelText: 'Place Location',
                          //       ),
                          //       validator: (value) {
                          //         if (value!.isEmpty ||
                          //             !RegExp(r'^[a-zA-Z0-9]+$')
                          //                 .hasMatch(value)) {
                          //           //alpanumeric validator
                          //           return "enter a correct location";
                          //         } else {
                          //           return null;
                          //         }
                          //       }),
                          // ),
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
                            child: TextFormField(
                                controller: openingTimeController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place Opening Time',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^(?:[+0]9?)?[0-9]{0,12}$')
                                          .hasMatch(value)) {
                                    return "enter a correct time";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                controller: closingTimeController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Place Closing time',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^(?:[+0]9?)?[0-9]{0,12}$')
                                          .hasMatch(value)) {
                                    return "enter a correct time";
                                  } else {
                                    return null;
                                  }
                                }),
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
                                    await placeAdded(
                                     nameController.text,
                                      aboutController.text,
                                     cityController.text,
                                      priceController.text,
                                     openingTimeController.text,
                                    closingTimeController.text,
                                      );
                                        if (formkey.currentState!.validate())
                                   {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Successfully Added ')),
                                    );
                                    // Navigator.pushNamed(context, '/test');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Something went Wrong R-enter your data ')),
                                    );
                                  }
                                },
                              )),
                        ],
                      )))),
        ));
  }
}
