import 'package:flutter/material.dart';
import 'package:mobileapplication/model/place_model.dart';
import 'package:mobileapplication/widget/navigation_bar.dart';
import 'package:mobileapplication/wishlist.dart';

import '../../widget/category_card.dart';
import '../../widget/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int index = 0;
  // final screens = [
  //   Center(
  //     child: Text(
  //       'Page 1',
  //       style: TextStyle(fontSize: 72),
  //     ),
  //   ),
  //   Center(
  //     child: Text(
  //       'Page 2',
  //       style: TextStyle(fontSize: 72),
  //     ),
  //   ),
  //   WishList(),
  //   Center(
  //     child: Text(
  //       'Page 4',
  //       style: TextStyle(fontSize: 72),
  //     ),
  //   ),
  //   Center(
  //     child: Text(
  //       'Page 5',
  //       style: TextStyle(fontSize: 72),
  //     ),
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   //titleTextStyle: TextStyle(color: Colors.black),
      //   title: Text(
      //     "EgyMania",
      //     textAlign: TextAlign.right,
      //   ),
      // ),
      // drawer: Drawer(
      //     child: ListView(
      //   children: [
      //     DrawerHeader(
      //       child: Text('Drawer Header'),
      //       decoration: BoxDecoration(color: Colors.orange),
      //     ),
      //     ListTile(title: Text('item1')),
      //     ListTile(title: Text('item2')),
      //   ],
      // )),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(children: [
          // Row(
          //   children: [
          //     const CircleAvatar(
          //       radius: 27,
          //       backgroundImage: AssetImage("assets/profile.jpg"),
          //     ),
          //     const SizedBox(
          //       width: 15,
          //     ),
          //     RichText(
          //         text: const TextSpan(
          //             text: "Hello",
          //             style: TextStyle(color: Colors.black),
          //             children: [
          //           TextSpan(
          //               text: ",Remon",
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 18,
          //               ))
          //         ]))
          //   ],
          // ),
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
                      // const CircleAvatar(
                      //   backgroundColor: Colors.orange,
                      //   child: Icon(
                      //     Icons.sort_by_alpha_sharp,
                      //     color: Colors.white,
                      //   ),
                      // )
                      Column(children: <Widget>[
                        SizedBox(height: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/Searchplaces');
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.orange,
                              //radius: 10.0,
                              child: Icon(
                                Icons.sort_by_alpha_sharp,
                                color: Colors.white,
                              )),
                        ),
                      ]),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 80,
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
            height: 80,
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
                            press: () {},
                          )
                        ],
                      ),
                    );
                  }))
        ]),
      )),
      // bottomNavigationBar: NavigationBarTheme(
      //     data: NavigationBarThemeData(
      //         indicatorColor: Colors.orange,
      //         labelTextStyle: MaterialStateProperty.all(
      //           TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      //         )),
      //     child: NavigationBar(
      //       height: 60,
      //       backgroundColor: Colors.transparent,
      //       labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //       selectedIndex: index,
      //       onDestinationSelected: (index) =>
      //           setState(() => this.index = index),
      //       destinations: [
      //         NavigationDestination(
      //             icon: Icon(Icons.tour_outlined),
      //             selectedIcon: Icon(Icons.tour_rounded),
      //             label: 'Explore'),
      //         NavigationDestination(
      //             icon: Icon(Icons.event_available_outlined),
      //             selectedIcon: Icon(Icons.event_available_rounded),
      //             label: 'Events'),
      //         NavigationDestination(
      //             icon: Icon(Icons.favorite_border_outlined),
      //             selectedIcon: Icon(Icons.favorite),
      //             label: 'Wish List'),
      //         NavigationDestination(
      //             icon: Icon(Icons.map_outlined),
      //             selectedIcon: Icon(Icons.map),
      //             label: 'My Plans'),
      //         NavigationDestination(
      //             icon: Icon(Icons.account_box_outlined),
      //             selectedIcon: Icon(Icons.account_box_rounded),
      //             label: 'Account'),
      //       ],
      //     )),
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
      //  bottomNavigationBar: NavigationBarTheme
    );
  }
}
