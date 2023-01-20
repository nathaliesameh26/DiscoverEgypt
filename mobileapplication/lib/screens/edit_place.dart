import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/place_data.dart';
import 'package:mobileapplication/data/repo/places_provider.dart';
import 'package:mobileapplication/model/place_model.dart';

class EditPlacePage extends ConsumerStatefulWidget {
  @override
 ConsumerState<EditPlacePage> createState() => _EditPlacePageState();
}

class _EditPlacePageState extends ConsumerState<EditPlacePage> {
  final _formKey = GlobalKey<FormState>();
  final Place_Data = PlacesData();

  late TextEditingController nameController;
  late TextEditingController aboutController;
  late TextEditingController priceController;
  late TextEditingController cityController;
  late TextEditingController locationController;
  late TextEditingController openingTimeController;
  late TextEditingController closingTimeController;

  @override
  void initState() {
    super.initState();
    final placeData = ref.read(placesDataProvider).value;
    aboutController = TextEditingController(text: placeData.get('name'));
    priceController =
        TextEditingController(text: placeData.get('price').toString());
    cityController = TextEditingController(text: placeData.get('city'));
    locationController = TextEditingController(text: placeData.get('location'));
    closingTimeController =
        TextEditingController(text: placeData.get('openingtime'));
    closingTimeController =
        TextEditingController(text: placeData.get('closingtime'));
  }

  @override
  Widget build(BuildContext context) {
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
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {

                        
    if (_formKey.currentState!.validate()) {
       _formKey.currentState!.save();
      Place_Data.updatePlaceDetails(       
                           nameController.text,
                          aboutController.text,
                   priceController.text,
                 cityController.text,
  locationController.text,
 openingTimeController.text,
closingTimeController.text
);
      Navigator.pop(context);
    }
  
//                         Place_Data.UpdatePlace(
//                           nameController.text,
//                           aboutController.text,
//                    priceController.text,
//                  cityController.text,
//   locationController.text,
//  openingTimeController.text,
// closingTimeController.text,

//                         ).then
//                         (value)=>   ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Successfully Added')),
//                         );

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
          
        )
        
        );
        
  }
  
  
}


