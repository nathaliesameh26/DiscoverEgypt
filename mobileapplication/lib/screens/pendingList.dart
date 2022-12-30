import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
