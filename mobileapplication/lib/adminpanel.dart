import 'package:flutter/material.dart';

class adminpanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return adminpanelState();
  }
}

class adminpanelState extends State<adminpanel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test App",
        home: Scaffold(
            body: Center(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/kyaking.jpg'),
                  const Text(
                    ' great event that can be done in the nile',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const Text(
                    'location : Alzamalek',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const Text(
                    'opening time : 9:00 am',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const Text(
                    'closing time : 5:00 pm',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const Text(
                    'Cost : 250',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            appBar: AppBar(title: const Text("Sight seeing places ")),
            floatingActionButton: Wrap(
                //will break to another line on overflow
                direction:
                    Axis.horizontal, //use vertical to show  on vertical axis
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: FloatingActionButton(
                        onPressed: () {
                          //action code for button 1
                        },
                        child: const Text('Edit'),
                      )), //button first

                  Container(
                      margin: const EdgeInsets.all(10),
                      child: FloatingActionButton(
                        onPressed: () {
                          //action code for button 2
                        },
                        backgroundColor: Colors.deepPurpleAccent,
                        child: const Text('Delete'),
                      )), // button second
                ])));
  }
}
