import 'package:flutter/material.dart';
import 'package:mobileapplication/model/place_model.dart';
import 'package:mobileapplication/widget/navigation_bar.dart';
import 'package:mobileapplication/screens/home/home_screen.dart';
import 'package:mobileapplication/wishlist.dart';

import '../../widget/category_card.dart';
import '../../widget/category_card.dart';

class MyPlans extends StatefulWidget {
  const MyPlans({super.key});

  @override
  State<MyPlans> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: [
          const SizedBox(
            height: 80,
          ),
          const Text("My Plans",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/myplans.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextButton(
              child: const Text(
                "Add Plans Now",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/homescreen');
              },
            ),
          ),
        ]),
      )),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final PlaceInfo placeInfo;
  final VoidCallback press;
  const RecommendedCard({
    Key? key,
    required this.placeInfo,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation: 5,
      child: Container(
        height: 210,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              // width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(placeInfo.image))),
            ),
            Text(
              placeInfo.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                ),
                Text(placeInfo.location,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
