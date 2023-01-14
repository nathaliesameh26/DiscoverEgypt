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
                const InputField(
                  title: 'Name',
                  hint: 'Enter name here...',
                ),
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

//   _showTime() {
//     return showTimePicker(
//         initialEntryMode: TimePickerEntryMode.input,
//         context: context,
//         initialTime: TimeOfDay(
//           hour: int.parse(_startTime.split(":")[0]),
//           minute: int.parse(_startTime.split(":")[1].split(":")[0]),
//         ));
//   }
}
