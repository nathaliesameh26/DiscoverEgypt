import 'package:flutter/material.dart';
import 'package:mobileapplication/model/place_model.dart';
import 'package:mobileapplication/widget/navigation_bar.dart';
import 'package:mobileapplication/screens/home_screen.dart';

import '../../../widget/category_card.dart';
import '../../../widget/category_card.dart';

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
