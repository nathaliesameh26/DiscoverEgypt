import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class crudplaces extends StatefulWidget {
  const crudplaces({super.key});

  @override
  State<crudplaces> createState() => _crudplacesState();
}

class _crudplacesState extends State<crudplaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD PLACES'),
      ),
    );
  }
}
