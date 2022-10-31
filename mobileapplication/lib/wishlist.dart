import 'package:flutter/material.dart';
import 'package:mobileapplication/model/place_model.dart';
import 'package:mobileapplication/widget/navigation_bar.dart';
import 'package:mobileapplication/screens/home/home_screen.dart';

import '../../widget/category_card.dart';
import '../../widget/category_card.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int index = 0;
  final screens = [
    HomeScreen(),
    Center(
      child: Text(
        'Page 2',
        style: TextStyle(fontSize: 72),
      ),
    ),
    WishList(),
    Center(
      child: Text(
        'Page 4',
        style: TextStyle(fontSize: 72),
      ),
    ),
    Center(
      child: Text(
        'Page 5',
        style: TextStyle(fontSize: 72),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        //titleTextStyle: TextStyle(color: Colors.black),
        title: Text(
          "EgyMania",
          textAlign: TextAlign.right,
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(color: Colors.orange),
          ),
          ListTile(title: Text('item1')),
          ListTile(title: Text('item2')),
        ],
      )),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          const Text("Your WishList",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/wishlist.jpeg"),
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
                "Add Now",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
        ]),
      )),
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.orange,
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.tour_outlined),
                  selectedIcon: Icon(Icons.tour_rounded),
                  label: 'Explore'),
              NavigationDestination(
                  icon: Icon(Icons.event_available_outlined),
                  selectedIcon: Icon(Icons.event_available_rounded),
                  label: 'Events'),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border_outlined),
                  selectedIcon: Icon(Icons.favorite),
                  label: 'Wish List'),
              NavigationDestination(
                  icon: Icon(Icons.map_outlined),
                  selectedIcon: Icon(Icons.map),
                  label: 'My Plans'),
              NavigationDestination(
                  icon: Icon(Icons.account_box_outlined),
                  selectedIcon: Icon(Icons.account_box_rounded),
                  label: 'Account'),
            ],
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
