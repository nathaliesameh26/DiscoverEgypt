import 'package:flutter/material.dart';
import 'package:mobileapplication/widget/input_field.dart';
import 'package:intl/intl.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "10:00 PM";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/cairov.jpg'),
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.9),
                BlendMode.modulate,
              ),
              fit: BoxFit.fitHeight),
        ),
        child: Scaffold(
          appBar: AppBar(
              title: Text(
                'Add Your Event',
                style: Theme.of(context).textTheme.headline6,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  )),
              actions: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/personIco.jpg'),
                )
              ]),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const InputField(title: 'Name', hint: 'Enter name here...'),
                  const InputField(
                      title: 'Description', hint: 'Enter description here...'),
                  const InputField(title: 'City', hint: 'Enter city here.'),
                  const InputField(
                      title: 'Event\'s Location ',
                      hint: 'Enter location here.'),
                  const InputField(
                      title: 'Event\'s Ticket Price ',
                      hint: 'Enter price here.'),
                  InputField(
                      title: 'Event\'s Start Date  ',
                      hint: DateFormat.yMMMd().format(_selectedDate),
                      widget: IconButton(
                          icon: const Icon(Icons.calendar_today_outlined),
                          color: Colors.black,
                          onPressed: () {
                            // print("hi there");
                            _getDateFormat();
                          })),
                  InputField(
                      title: 'Event\'s End Date  ',
                      hint: DateFormat.yMMMd().format(_selectedDate),
                      widget: IconButton(
                          icon: const Icon(Icons.calendar_today_outlined),
                          color: Colors.black,
                          onPressed: () {
                            _getDateFormat();
                          })),
                  Row(
                    children: [
                      Expanded(
                          child: InputField(
                              title: "Opening Time",
                              hint: _startTime,
                              widget: IconButton(
                                onPressed: () async {
                                  // _getTimeFromUser(isStarTime: true);
                                  TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: time,
                                  );
                                  if (newTime == null) return;
                                  setState(() => time = newTime);
                                },
                                icon: Icon(Icons.access_time_rounded),
                                color: Colors.black,
                              ))),
                      const SizedBox(width: 10),
                      Expanded(
                          child: InputField(
                              title: "Closing Time",
                              hint: _endTime,
                              widget: IconButton(
                                onPressed: () async {
                                  TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: time,
                                  );
                                  if (newTime == null) return;
                                  setState(() => time = newTime);
                                },
                                icon: const Icon(Icons.access_time_rounded),
                                color: Colors.black,
                              )))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _getDateFormat() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print("is null or smth s wrong");
    }
  }

  _getTimeFromUser({required bool isStarTime}) async {
    var pickedTime = await _showTime();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStarTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStarTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTime() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(":")[0]),
        ));
  }
}

 

// class EventForm extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return EPformState();
//   }
// }

// class EPformState extends State<EventForm> {
//   final formkey = GlobalKey<FormState>();
//   String name = "";
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           backgroundColor: Colors.orange,
//           elevation: 10,
//           title: const Text("Add your event"),
//         ),
//         body: Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: const AssetImage('assets/temple.jpg'),
//                   colorFilter: ColorFilter.mode(
//                     Colors.white.withOpacity(0.5),
//                     BlendMode.modulate,
//                   ),
//                   fit: BoxFit.fitHeight),
//             ),
//             child: SingleChildScrollView(
//               physics: AlwaysScrollableScrollPhysics(),
//               padding: EdgeInsets.symmetric(),
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 48, right: 48),
//                   child: Form(
//                     key: formkey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: height * 0.04),
//                         const Text("Add Your Event Details",
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 color: Color.fromARGB(15, 255, 255, 255))),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The Event Name"),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
//                                 return "enter a correct name";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: "Enter thr Event's description"),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
//                                 return "enter a correct description";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The Event's location"),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r"^[a-zA-Z0-9.]+\.[a-zA-Z]+")
//                                       .hasMatch(value)) {
//                                 return "enter a correct location";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The Event's start date "),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$')
//                                       .hasMatch(value)) {
//                                 return "enter a correct date";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The Event's end date "),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$')
//                                       .hasMatch(value)) {
//                                 return "enter a correct date";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The Event's opening time "),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'^[a-zA-Z]+|\s').hasMatch(value)) {
//                                 return "enter a correct time";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The Event's closing time "),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'^[a-zA-Z]+|\s').hasMatch(value)) {
//                                 return "enter a correct time";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Validate returns true if the form is valid, or false otherwise.
//                             if (formkey.currentState!.validate()) {
//                               // If the form is valid, display a snackbar. In the real world,
//                               // you'd often call a server or save the information in a database.
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Processing Data')),
//                               );
//                             }
//                           },
//                           child: const Text('Submit'),
//                         ),
//                       ],
//                     ),
//                   )),
//             )));
//   }
// }
