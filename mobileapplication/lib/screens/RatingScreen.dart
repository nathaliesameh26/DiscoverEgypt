import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class raiting extends StatefulWidget {
  const raiting({super.key});

  @override
  State<raiting> createState() => _raitingState();
}

class _raitingState extends State<raiting> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('your rating:$rating'),
            SizedBox(height: 30),
            RatingBar.builder(
              minRating: 1,
              itemBuilder: ((context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  )),
              updateOnDrag: true,
              onRatingUpdate: (rating) => setState(() {
                this.rating = rating;
              }),
            ),
          ]),
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'visits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'profile',
          ),
        ]));
  }
}
