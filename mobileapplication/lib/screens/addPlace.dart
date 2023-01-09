import 'package:flutter/material.dart';
import 'package:mobileapplication/widget/input_field.dart';
import 'package:intl/intl.dart';

class PlaceForm extends StatefulWidget {
  const PlaceForm({super.key});

  @override
  State<PlaceForm> createState() => _EventFormState();
}

class _EventFormState extends State<PlaceForm> {
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
              Colors.white.withOpacity(0.5),
              BlendMode.modulate,
            ),
            fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add A New Place',
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {},
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const InputField(title: 'Name', hint: 'Enter name here...'),
                const InputField(
                    title: 'Description', hint: 'Enter description here...'),
                const InputField(title: 'City', hint: 'Enter city here.'),
                const InputField(
                    title: 'Place\'s Location ', hint: 'Enter location here.'),
                const InputField(
                    title: 'Place\'s Ticket Price ', hint: 'Enter price here.'),
                Row(children: [
                  Expanded(
                      child: InputField(
                    title: "Opening Time",
                    hint: _startTime,
                    // widget: IconButton(
                    //   onPressed: () async {
                    //     // _getTimeFromUser(isStarTime: true);
                    //     TimeOfDay? newTime = await showTimePicker(
                    //       context: context,
                    //       initialTime: time,
                    //     );
                    //     if (newTime == null) return;
                    //     setState(() => time = newTime);
                    //   },
                    //   icon: Icon(Icons.access_time_rounded),
                    //   color: Colors.black,
                    // )
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InputField(
                      title: "Closing Time",
                      hint: _endTime,
                      // widget: IconButton(
                      //   onPressed: () async {
                      //     TimeOfDay? newTime = await showTimePicker(
                      //       context: context,
                      //       initialTime: time,
                      //     );
                      //     if (newTime != null) {
                      //       setState(() {
                      //         _selectedDate = newTime as DateTime;
                      //         print(_selectedDate);
                      //       });
                      //     } else {
                      //       print("is null or smth s wrong");
                      //     }
                      //   },
                      //   icon: const Icon(Icons.access_time_rounded),
                      //   color: Colors.black,
                      // )
                    ),
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    child: const Text('Submit Form'),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
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



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class placeform extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return placeformState();
//   }
// }

// class placeformState extends State<placeform> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController aboutController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController openingTimeController = TextEditingController();
//   TextEditingController closingTimeController = TextEditingController();
//   TextEditingController ratingController = TextEditingController();
//   TextEditingController imageController = TextEditingController();

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
//           title: const Text("Add A Sightseeing Place"),
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
//                             controller: nameController,
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The place Name"),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
//                                 return "enter a correct place name";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         SizedBox(height: height * 0.05),
//                         TextFormField(
//                             controller: aboutController,
//                             decoration: const InputDecoration(
//                                 labelText: "Enter the place's description"),
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
//                             controller: locationController,
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The place's location"),
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
//                             controller: openingTimeController,
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The place's opening time "),
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
//                             controller: closingTimeController,
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The place's closing time "),
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
//                             controller: ratingController,
//                             decoration: const InputDecoration(
//                                 labelText: "Enter The place's rating "),
//                             validator: (value) {
//                               if (value!.isEmpty ||
//                                   !RegExp(r'^[a-zA-Z]+|\s').hasMatch(value)) {
//                                 return "enter a correct rating";
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         ElevatedButton(
//                           onPressed: () async {
//                             // Validate returns true if the form is valid, or false otherwise.
//                             if (formkey.currentState!.validate()) {
//                               //DatabaseService service = DatabaseService();
//                               // If the form is valid, display a snackbar. In the real world,
//                               // you'd often call a server or save the information in a database.
//                               // ScaffoldMessenger.of(context).showSnackBar(
//                               //   const SnackBar(
//                               //       content: Text('Processing Data')),
//                               // );
//                               FirebaseFirestore.instance
//                                   .collection('places')
//                                   .add({'text': 'data added through app'});
//                             }
//                           },
//                           child: const Text('Add place'),
//                         ),
//                       ],
//                     ),
//                   )),
//             )));
//   }
// }
