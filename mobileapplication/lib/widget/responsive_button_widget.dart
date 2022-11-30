import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 50,
        // ),
        Padding(
          padding: const EdgeInsets.only(bottom: 90.0),
          child: ElevatedButton(
            onPressed: () {},
            // ignore: prefer_const_constructors
            style: ElevatedButton.styleFrom(
              primary: Colors.white54, // Background color
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('Lets Get Started!'),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
