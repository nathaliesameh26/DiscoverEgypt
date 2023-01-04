import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed('/Welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset('assets/Logo.jpeg'),
          ),
          const Padding(
            padding: EdgeInsets.all(50),
            child: Text(
              'Explore New Places With Us!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Padding(
  // padding: const EdgeInsets.all(8.0),
  //),

  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.only(top: 90),
  //         child: Container(
  //           child: Image.asset('assets/temple.jpg'),
  //         ),
  //       ),
  //       // ignore: prefer_const_constructors
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(45, 280, 0, 50),
  //         // child: Container(
  //         child: const Text(
  //           " Explore New Places With Us!",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 25.0,
  //             fontWeight: FontWeight.bold,
  //             fontFamily: 'Roboto',
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(170, 395, 10, 50),
  //         child: ElevatedButton(
  //           child: Text('Get Started'),
  //           style: ElevatedButton.styleFrom(
  //             foregroundColor: Colors.black,
  //             backgroundColor: Colors.white,
  //             textStyle: const TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 15,
  //                 fontStyle: FontStyle.normal),
  //             shape: BeveledRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10))),
  //           ),
  //           onPressed: () {
  //             Navigator.of(context).pushNamed("/login");
  //           },
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(188, 460, 0, 50),
  //         child: ElevatedButton(
  //           child: Text('Skip'),
  //           style: ElevatedButton.styleFrom(
  //             foregroundColor: Colors.black,
  //             backgroundColor: Colors.white,
  //             textStyle: const TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 13,
  //                 fontStyle: FontStyle.normal),
  //             shape: BeveledRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10))),
  //           ),
  //           onPressed: () {},
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
