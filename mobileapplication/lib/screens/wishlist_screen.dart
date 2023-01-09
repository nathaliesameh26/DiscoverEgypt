import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Your Favorites",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "4 items",
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
