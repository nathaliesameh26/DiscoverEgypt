import 'package:flutter/material.dart';

class Eventform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EPformState();
  }
}

class EPformState extends State<Eventform> {
  final formkey = GlobalKey<FormState>();
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Add your event"),
      ),
      backgroundColor: const Color(0xFFfffff),
      body: Container(
          padding: const EdgeInsets.only(left: 48, right: 48),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const Text("Add Your Event Details",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(15, 208, 19, 19))),
                SizedBox(height: height * 0.05),
                TextFormField(
                    decoration:
                        InputDecoration(labelText: "Enter The Event Name"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'[a-z A-Z]*$').hasMatch(value)) {
                        return "enter a correct name";
                      } else {
                        return null;
                      }
                    })
              ],
            ),
          )),
    );
  }
}
  // String? _name;
  // String? _desc;
  // String? _location;
  // String? _startdate;
  // String? _enddate;
  // String? _price;
  // String? _opentime;
  // String? _closetime;

  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // Widget? buildName() {
  //   return null;
  // }

  //  Widget? buildDesc() {
  //   return null;
  // }
  //  Widget? buildLocation() {
  //   return null;
  // }
  // Widget? buildStartdate() {
  //   return null;
  // }

  //  Widget? buildEneddate() {
  //   return null;
  // }

  //  Widget? buildPrice() {
  //   return null;
  // }
  //  Widget? buildOpentime() {
  //   return null;
  // }

  //  Widget? buildClosetime() {
  //   return null;
  // }
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     buildName(),
            //     buildDesc(),
            //     buildLocation(),
            //     buildEneddate(),
            //     buildPrice(),
            //     buildOpentime(),
            //     buildClosetime(),
            //     SizedBox(height: 100,)
            //   ],
            // ),