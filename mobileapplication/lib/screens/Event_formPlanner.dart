import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileapplication/data/dataApp/events_data.dart';

class eventFormPlanner extends StatefulWidget {
  const eventFormPlanner({Key? key}) : super(key: key);

  @override
  State<eventFormPlanner> createState() => _eventFormPlannerState();
}

final plannerformkey = GlobalKey<FormState>();
TimeOfDay time = TimeOfDay.now();

class _eventFormPlannerState extends State<eventFormPlanner> {
  final eventdata = EventsData();
  DateTime date = DateTime(2023, 1, 23);
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController openingTimeController = TextEditingController();
  TextEditingController closingTimeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController plannerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text(
            'Add A New Event',
            style: Theme.of(context).textTheme.headline6,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/planner');
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
                      key: plannerformkey,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Enter the event details please ',
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                controller: plannerNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your name',
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
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Event Name',
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
                                  labelText: 'Event Description ',
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
                                  labelText: 'Event City',
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
                                  labelText: 'Event Location',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
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
                                  labelText: 'Event Price',
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
                              controller: startDateController,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  labelText: "Enter Start Date"),
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    startDateController.text = formattedDate;
                                    //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: endDateController,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  suffixIcon: const Icon(Icons.calendar_today),
                                  labelText: "Enter End Date"),
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    endDateController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
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
                                  backgroundColor: Colors.blue,
                                ),
                                child: const Text('Submit'),
                                onPressed: () async {
                                  if (plannerformkey.currentState!.validate()) {
                                    await eventdata.eventAddedPlanner(
                                      name: nameController.text,
                                      about: aboutController.text,
                                      city: cityController.text,
                                      plannerName: plannerNameController.text,
                                      price: priceController.text,
                                      openingTime: openingTimeController.text,
                                      closingTime: closingTimeController.text,
                                      startdate: startDateController.text,
                                      enddate: endDateController.text,
                                      location: locationController.text,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Successfully Added to the admin\'s pending list')),
                                    );
                                    Navigator.pushNamed(context, '/planner');
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
