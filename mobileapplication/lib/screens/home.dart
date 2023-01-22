import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobileapplication/data/dataApp/myplans_data.dart';
import 'package:mobileapplication/data/dataApp/wishlist_data.dart';
import 'package:mobileapplication/screens/Search_screen.dart';
import 'package:mobileapplication/screens/auth_page.dart';
import 'package:mobileapplication/screens/currentWeather.dart';
import 'package:mobileapplication/screens/events_carousel.dart';
import 'package:mobileapplication/screens/homeScreen.dart';
import 'package:mobileapplication/screens/wishlist_screen.dart';
import '../data/dataApp/place_data.dart';
import '../data/repo/user_provider.dart';
import '../widget/nav_bar_test.dart';
import '../widget/navigation_bar.dart';
import '../widget/username_show.dart';
import 'destination_carousel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'myplan_screen.dart';

//add navigation bar in scaffold that can navigate to other pages?

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final cityobject = PlacesData.placecity();
  int currentIndex = 0;
  final screens = [
    const HomeScreenn(),
    MyPlansScreen(),
    const SearchPage(),
    CurrentWeatherPage(),
    const AuthPage(),
  ];
  int _selectedIndex = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.houseMedical,
    FontAwesomeIcons.eye,
    FontAwesomeIcons.arrowsToEye,
    FontAwesomeIcons.searchengin,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          print(_selectedIndex);
        },
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Theme.of(context).cardColor
                  : const Color.fromARGB(15, 196, 189, 196),
              borderRadius: BorderRadius.circular(30)),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : const Color.fromARGB(224, 0, 0, 0),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavigationBarTheme(
      //     data: NavigationBarThemeData(
      //       indicatorColor: Colors.blue.shade100,
      //       labelTextStyle: MaterialStateProperty.all(
      //           TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      //     ),
      //     child: NavigationBar(
      //       height: 60,
      //       backgroundColor: Colors.grey,

      //       selectedIndex: index,
      //       onDestinationSelected: (index) =>
      //           setState(() => this.index = index),
      //       destinations: [
      //         // screens[index],
      //         // ignore: prefer_const_literals_to_create_immutables
      //         NavigationBar(destinations: [
      //           const NavigationDestination(
      //               icon: Icon(Icons.home), label: 'Home'),
      //           const NavigationDestination(
      //               icon: Icon(Icons.favorite_border), label: 'Wishlist'),
      //           const NavigationDestination(
      //               icon: Icon(Icons.book), label: 'Plans'),
      //           const NavigationDestination(
      //               icon: Icon(Icons.person), label: 'Profile')
      //         ])
      //       ],
      //       // bottomNavigationBar: const GNav(
      //       //   tabBackgroundColor: Colors.grey,
      //       //   tabs: [
      //       //     GButton(
      //       //       icon: Icons.home,
      //       //       text: 'Home',
      //       //       //onPressed: () {},
      //       //     ),
      //       //     GButton(
      //       //       icon: Icons.favorite_border,
      //       //       text: 'Favorites',
      //       //     ),
      //       //     GButton(
      //       //       icon: Icons.book,
      //       //       text: 'Plans',
      //       //     ),
      //       //     GButton(
      //       //       icon: Icons.person,
      //       //       text: 'Profile',
      //       //     ),
      //       //   ],
      //       // ),
      //     )),
      appBar: AppBar(
        title: Consumer(
          builder: (_, ref, __) {
            return ref.watch(userDataProvider).when(
              data: (value) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      '${value.get('firstname')} ${value.get('lastname')}',

                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                );
              },
              error: (Object error, StackTrace stackTrace) {
                return const Text(
                  'EgyMania',
                  style: TextStyle(fontSize: 20),
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            );
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.white70,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trip_origin),
              label: 'Event',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Temp',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ]),
    );
  }
}

// BottomNavigationBar buildNavBar(BuildContext context) {
//
class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int index = 0;
  final screens = [
    const Center(
      child: Text(
        'Page 1',
        style: TextStyle(fontSize: 72),
      ),
    ),
    const Center(
      child: Text(
        'Page 2',
        style: TextStyle(fontSize: 72),
      ),
    ),
    const Center(
      child: Text(
        'Page 3',
        style: TextStyle(fontSize: 72),
      ),
    ),
    const Center(
      child: Text(
        'Page 4',
        style: TextStyle(fontSize: 72),
      ),
    ),
    const Center(
      child: Text(
        'Page 5',
        style: TextStyle(fontSize: 72),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.orange,
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            // ignore: prefer_const_literals_to_create_immutables
            destinations: [
              const NavigationDestination(
                  icon: Icon(Icons.tour_outlined),
                  selectedIcon: Icon(Icons.tour_rounded),
                  label: 'Explore'),
              const NavigationDestination(
                  icon: Icon(Icons.event_available_outlined),
                  selectedIcon: Icon(Icons.event_available_rounded),
                  label: 'Events'),
              const NavigationDestination(
                  icon: Icon(Icons.favorite_border_outlined),
                  selectedIcon: Icon(Icons.favorite),
                  label: 'Wish List'),
              const NavigationDestination(
                  icon: Icon(Icons.map_outlined),
                  selectedIcon: Icon(Icons.map),
                  label: 'My Plans'),
              const NavigationDestination(
                  icon: Icon(Icons.account_box_outlined),
                  selectedIcon: Icon(Icons.account_box_rounded),
                  label: 'Account'),
            ],
          )),
    );
  }
}
