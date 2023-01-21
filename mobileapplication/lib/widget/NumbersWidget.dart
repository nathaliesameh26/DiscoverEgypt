import 'package:flutter/material.dart';

class NumbersWidgets extends StatelessWidget {
  const NumbersWidgets({super.key});

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '40', 'places'),
          buildDivider(),
          buildButton(context, '20', 'events'),
          buildDivider(),
          buildButton(context, '100', 'users')
        ],
      ));
  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(
          color: Colors.black,
        ),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      );
}
