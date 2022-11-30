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
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton.icon(
            // <-- OutlinedButton
            onPressed: () {},
            icon: Icon(
              Icons.download,
              size: 24.0,
            ),
            label: Text('Lets Get Started'),
          ),
        ),
      ],
    );
  }
}
