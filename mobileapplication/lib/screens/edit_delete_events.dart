import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class crudevents extends StatefulWidget {
  const crudevents({super.key});

  @override
  State<crudevents> createState() => _crudeventsState();
}

class _crudeventsState extends State<crudevents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD EVENTS'),
      ),
    );
  }
}
