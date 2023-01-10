import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobileapplication/widget/input_field.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

final List<String> items = [
  'Cairo',
  'Luxor',
  'Aswan',
  'Fayoum',
];
String? selectedValue;

class _EventFormState extends State<EventForm> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = "";
    dateinput2.text = ""; //set the initial value of text field
    super.initState();
  }

  // DateTime _selectedDate = DateTime.now();
  // String _endTime = "10:00 PM";
  // String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  // TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/cairov.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Your Event',
              style: Theme.of(context).textTheme.headline6),
          elevation: 0,
          backgroundColor: Colors.blue,
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
            //   CircleAvatar(
            //     backgroundImage: AssetImage('assets/personIco.jpg'),
            //   )
          ],
        ),
        body: Card(
          //child: Card(
          elevation: 7, // Change this
          shadowColor: Colors.black, // Change this
          //padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(height: 10.0),
                const Text("Adding Events Details",
                    //mafrod akhod el esm mn el login 3ashan myktbossh tany
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 0, 0, 0))),
                const SizedBox(height: 15.0),
                TextFormField(
                    // controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.abc),
                      labelText: 'Name of the event',
                      hintText: 'Enter the name of the event',
                    ),
                    textInputAction: TextInputAction.done,

                    // decoration: const InputDecoration(
                    //   prefixIcon: Icon(Icons.favorite),
                    //   //hintText: 'Event Name',
                    //   labelText: "Enter the name of the place here",
                    //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //   enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(width: 1, color: Colors.black),
                    //   ),
                    // ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
                        return "enter a correct place name";
                      } else {
                        return null;
                      }
                    }),

                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'city',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                DropdownButtonHideUnderline(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Enter the city',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 200,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      //searchController: textEditingController,
                      // ignore: prefer_const_constructors
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        // child: TextFormField(
                        //   //controller: email,
                        //   style: TextStyle(color: Colors.black),
                        //   decoration: const InputDecoration(
                        //     prefixIcon: Icon(Icons.favorite),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(width: 1, color: Colors.black),
                        //     ),
                        //     labelText: "Enter The city",

                        //     //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                        //     hintStyle: TextStyle(color: Colors.white),
                        //   ),
                        //   validator: (value) {
                        //     if (value!.isEmpty ||
                        //         !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //             .hasMatch(value)) {
                        //       return "Enter the description correctly";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  //controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                    labelText: 'Location',
                    hintText: 'Enter the location of the event',
                  ),
                  textInputAction: TextInputAction.done,
                  // style: TextStyle(color: Colors.black),
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.favorite),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(width: 1, color: Colors.black),
                  //   ),
                  //   labelText: "Enter the location",
                  //   //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                  //   hintStyle: TextStyle(color: Colors.white),
                  // ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter the description correctly";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  //controller: email,
                  // style: TextStyle(color: Colors.black),
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.favorite),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(width: 1, color: Colors.black),
                  //   ),
                  //   labelText: "Enter the ticket price",
                  //   //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                  //   hintStyle: TextStyle(color: Colors.white),
                  // ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.price_change),
                    labelText: 'Price',
                    hintText: 'Enter the ticket price of the event',
                  ),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter the description correctly";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Start Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },

                  // //controller: email,
                  // style: TextStyle(color: Colors.black),
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.favorite),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(width: 1, color: Colors.black),
                  //   ),
                  //   labelText: "Start Date",
                  //   //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                  //   hintStyle: TextStyle(color: Colors.white),
                  // ),
                  // validator: (value) {
                  //   if (value!.isEmpty ||
                  //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //           .hasMatch(value)) {
                  //     return "Enter the description correctly";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: dateinput2, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter End Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  // //controller: email,
                  // style: TextStyle(color: Colors.black),
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.favorite),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(width: 1, color: Colors.black),
                  //   ),
                  //   labelText: "End date",
                  //   //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                  //   hintStyle: TextStyle(color: Colors.white),
                  // ),
                  // validator: (value) {
                  //   if (value!.isEmpty ||
                  //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //           .hasMatch(value)) {
                  //     return "Enter the description correctly";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  //controller: email,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description),
                    labelText: 'Enter Description about the event',
                    hintText: 'Description',
                  ),
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.favorite),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(width: 1, color: Colors.black),
                  //   ),
                  //   labelText: "Enter it's Description",
                  //   //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                  //   hintStyle: TextStyle(color: Colors.white),
                  // ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter the description correctly";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),

                TextFormField(
                  //controller: email,

                  // style: TextStyle(color: Colors.black),
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.favorite),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(width: 1, color: Colors.black),
                  //   ),
                  //   labelText: "Start Time",
                  //   //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                  //   hintStyle: TextStyle(color: Colors.white),
                  // ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.timer),
                    labelText: 'Start Time',
                    hintText: 'Enter the Start Time of the event',
                  ),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter the description correctly";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  //controller: email,
                  // style: TextStyle(color: Colors.black),
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.favorite),
                  //   enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(width: 1, color: Colors.black),
                  //   ),
                  //   labelText: "End time",
                  //   //mafrod bardo akhod el email bta3o mn el info bt3to law howa 3aml login
                  //   hintStyle: TextStyle(color: Colors.white),
                  // ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.timer),
                    labelText: 'End Time',
                    hintText: 'Enter the End Time of the event',
                  ),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter the description correctly";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                minimumSize: Size(150, 40)),
                            child: Text(
                              "Add",
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ))
                      ]),
                )

                // const InputField(title: 'Name ', hint: 'Enter name here...'),
                // const InputField(
                //     title: 'Description', hint: 'Enter description here...'),
                // const InputField(title: 'City', hint: 'Enter city here.'),
                // const InputField(
                //     title: 'Event\'s Location ', hint: 'Enter location here.'),
                // const InputField(
                //     title: 'Event\'s Ticket Price ', hint: 'Enter price here.'),
                // InputField(
                //   title: 'Event\'s Start Date  ',
                //   hint: DateFormat.yMMMd().format(_selectedDate),
                //   // widget: IconButton(
                //   //     icon: const Icon(Icons.calendar_today_outlined),
                //   //     color: Colors.black,
                //   //     onPressed: () {
                //   //       // _getDateFormat();
                //   //     })
                // ),
                // InputField(
                //   title: 'Event\'s End Date  ',
                //   hint: DateFormat.yMMMd().format(_selectedDate),
                //   // widget: IconButton(
                //   //     icon: const Icon(Icons.calendar_today_outlined),
                //   //     color: Colors.black,
                //   //     onPressed: () {
                //   //       // _getDateFormat();
                //   //     })
                // ),
                // Row(children: [
                //   Expanded(
                //       child: InputField(
                //     title: "Opening Time",
                //     hint: _startTime,
                //     // widget: IconButton(
                //     //   onPressed: () async {
                //     //     // _getTimeFromUser(isStarTime: true);
                //     //     TimeOfDay? newTime = await showTimePicker(
                //     //       context: context,
                //     //       initialTime: time,
                //     //     );
                //     //     if (newTime == null) return;
                //     //     setState(() => time = newTime);
                //     //   },
                //     //   icon: Icon(Icons.access_time_rounded),
                //     //   color: Colors.black,
                //     // )
                //   )),
                //   const SizedBox(width: 10),
                //   Expanded(
                //     child: InputField(
                //       title: "Closing Time",
                //       hint: _endTime,
                //       // widget: IconButton(
                //       //   onPressed: () async {
                //       //     TimeOfDay? newTime = await showTimePicker(
                //       //       context: context,
                //       //       initialTime: time,
                //       //     );
                //       //     if (newTime != null) {
                //       //       setState(() {
                //       //         _selectedDate = newTime as DateTime;
                //       //         print(_selectedDate);
                //       //       });
                //       //     } else {
                //       //       print("is null or smth s wrong");
                //       //     }
                //       //   },
                //       //   icon: const Icon(Icons.access_time_rounded),
                //       //   color: Colors.black,
                //       // )
                //     ),
                //   ),
                // ]),
                // SizedBox(
                //   height: 10,
                // ),
                // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //   ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.purple,
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 10, vertical: 15),
                //         textStyle: const TextStyle(
                //             fontSize: 15, fontWeight: FontWeight.bold)),
                //     child: const Text('Submit Form'),
                //   ),
                // ])
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }

  // _getDateFormat() async {
  //   DateTime? _pickerDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2023),
  //     lastDate: DateTime(2025),
  //   );

  //   if (_pickerDate != null) {
  //     setState(() {
  //       _selectedDate = _pickerDate;
  //       print(_selectedDate);
  //     });
  //   } else {
  //     print("is null or smth s wrong");
  //   }
  // }

  // _getTimeFromUser({required bool isStarTime}) async {
  //   var pickedTime = await _showTime();
  //   String _formatedTime = pickedTime.format(context);
  //   if (pickedTime == null) {
  //     print("Time canceled");
  //   } else if (isStarTime == true) {
  //     setState(() {
  //       _startTime = _formatedTime;
  //     });
  //   } else if (isStarTime == false) {
  //     setState(() {
  //       _endTime = _formatedTime;
  //     });
  //   }
  // }

  // _showTime() {
  //   return showTimePicker(
  //       initialEntryMode: TimePickerEntryMode.input,
  //       context: context,
  //       initialTime: TimeOfDay(
  //         hour: int.parse(_startTime.split(":")[0]),
  //         minute: int.parse(_startTime.split(":")[1].split(":")[0]),
  //       ));
  // }
}
