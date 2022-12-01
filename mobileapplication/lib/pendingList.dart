import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileapplication/addPlace.dart';

class pendinglist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return pendinglistState();
  }
}

class pendinglistState extends State<pendinglist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        // buildTop(),
        // buildContent(),
      ],
    ));
  }
}
