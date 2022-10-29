import 'package:flutter/material.dart';

class evform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EPformState();
  }
}

class EPformState extends State<evform> {
  // String _name;
  // String _desc;
  // String _location;
  // String _startdate;
  // String _enddate;
  // String _price;
  // String _opentime;
  // String _closetime;

  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // Widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your event"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
      ),
    );
  }
}
