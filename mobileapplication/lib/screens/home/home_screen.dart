import 'package:flutter/material.dart';
import 'package:mobileapplication/model/place_model.dart';
import 'package:mobileapplication/screens/detailsscreen/detail_screen.dart';

import '../../widget/category_card.dart';
import '../../widget/category_card.dart';
import '../../widget/recommended_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
              const SizedBox(
                width: 15,
              ),
              RichText(
                  text: const TextSpan(
                      text: "Hello",
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: ",Remon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ))
                  ]))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Explore Egypt",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Material(
              borderRadius: BorderRadius.circular(100),
              elevation: 7,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "search",
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.sort_by_alpha_sharp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text("places",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    CategoryCard(
                      press: () {},
                      image: "assets/lake.jpg",
                      title: "Events",
                    ),
                    CategoryCard(
                      press: () {},
                      image: "assets/seen.jpg",
                      title: "Sights",
                    ),
                  ],
                ),
              ],
            ),
          ),
          //recomend
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text("Recommendations",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              child: ListView.builder(
                  itemCount: places.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: Row(
                        children: [
                          RecommendedCard(
                            placeInfo: places[index],
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailSreen(
                                            placeInfo: places[index],
                                          )));
                            },
                          )
                        ],
                      ),
                    );
                  }))
        ]),
      )),
    );
  }
}
