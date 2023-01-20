import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobileapplication/data/dataApp/events_data.dart';
import 'package:mobileapplication/data/repo/events_provider.dart';

class EditEventPage extends ConsumerStatefulWidget {
  @override
  // _EditEventPageState createState() => _EditEventPageState();
  ConsumerState<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends ConsumerState<EditEventPage> {
  final _formKey = GlobalKey<FormState>();
  final Event_Data = EventsData();

  late TextEditingController nameController;
  late TextEditingController aboutController;
  late TextEditingController priceController;
  late TextEditingController cityController;
  late TextEditingController locationController;
  late TextEditingController startdateController;
  late TextEditingController enddateController;
  late TextEditingController openingTimeController;
  late TextEditingController closingTimeController;
  late String id;
  @override
  void initState() {
    super.initState();
    final EventsData = ref.read(eventsDataProvider).value;
    nameController = TextEditingController(text: EventsData.get('name'));
    aboutController = TextEditingController(text: EventsData.get('about'));
    priceController = TextEditingController(text: EventsData.get('price').toString());
    cityController = TextEditingController(text: EventsData.get('city'));
    locationController = TextEditingController(text: EventsData.get('location'));
    startdateController = TextEditingController(text: EventsData.get('startdate'));
    enddateController =TextEditingController(text: EventsData.get('enddate'));
    openingTimeController = TextEditingController(text: EventsData.get('openingTime'));
    closingTimeController =TextEditingController(text: EventsData.get('closingTime'));
     id = EventsData.get('id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 103, 58, 209),
          elevation: 0,
          title: Text(
            'Update Event',
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
                  TextField(
                    controller: startdateController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: 'Enter start Date',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          startdateController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: enddateController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: 'Enter end Date',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 10,
                          color: Colors.black12,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          enddateController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
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
                          _formKey.currentState!.save();
                          Event_Data.updateEventDetails(
                              id,
                              nameController.text,
                              aboutController.text,
                              priceController.text,
                              cityController.text,
                              locationController.text,
                              startdateController.text,
                              enddateController.text,
                              openingTimeController.text,
                              closingTimeController.text);
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
                      child: const Text('Event Updated'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
