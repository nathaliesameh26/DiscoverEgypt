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
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/cairov.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Your Event',
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
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
                    title: 'Event\'s Location ', hint: 'Enter location here.'),
                const InputField(
                    title: 'Event\'s Ticket Price ', hint: 'Enter price here.'),
                InputField(
                  title: 'Event\'s Start Date  ',
                  hint: DateFormat.yMMMd().format(_selectedDate),
                  // widget: IconButton(
                  //     icon: const Icon(Icons.calendar_today_outlined),
                  //     color: Colors.black,
                  //     onPressed: () {
                  //       // _getDateFormat();
                  //     })
                ),
                InputField(
                  title: 'Event\'s End Date  ',
                  hint: DateFormat.yMMMd().format(_selectedDate),
                  // widget: IconButton(
                  //     icon: const Icon(Icons.calendar_today_outlined),
                  //     color: Colors.black,
                  //     onPressed: () {
                  //       // _getDateFormat();
                  //     })
                ),
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
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
