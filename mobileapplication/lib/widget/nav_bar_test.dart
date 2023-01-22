// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class CustomNavBarWidget extends StatelessWidget {
//          final int selectedIndex;
//          final List<PersistentBottomNavBarItem> items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
//          final ValueChanged<int> onItemSelected;

//          CustomNavBarWidget(
//              {required Key key,
//              required this.selectedIndex,
//              required this.items,
//              required this.onItemSelected,});

//          Widget _buildItem(
//              PersistentBottomNavBarItem item, bool isSelected) {
//              return Container(
//              alignment: Alignment.center,
//              height: 60.0,
//              child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                  Flexible(
//                      child: IconTheme(
//                      data: IconThemeData(
//                          size: 26.0,
//                          color: isSelected
//                              ? (item.activeColorSecondary == null
//                                  ? item.activeColorPrimary
//                                  : item.activeColorSecondary)
//                              : item.inactiveColorPrimary == null
//                                  ? item.activeColorPrimary
//                                  : item.inactiveColorPrimary),
//                      child: item.icon,
//                      ),
//                  ),
//                  Padding(
//                      padding: const EdgeInsets.only(top: 5.0),
//                      child: Material(
//                      type: MaterialType.transparency,
//                      child: FittedBox(
//                          child: Text(
//                          item.title,
//                          style: TextStyle(
//                              color: isSelected
//                                  ? (item.activeColorSecondary == null
//                                      ? item.activeColorPrimary
//                                      : item.activeColorSecondary)
//                                  : item.inactiveColorPrimary,
//                              fontWeight: FontWeight.w400,
//                              fontSize: 12.0),
//                      )),
//                      ),
//                  )
//                  ],
//              ),
//              );
//          }

//          @override
//          Widget build(BuildContext context) {
//              return Container(
//              color: Colors.white,
//              child: Container(
//                  width: double.infinity,
//                  height: 60.0,
//                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: items.map((item) {
//                      int index = items.indexOf(item);
//                      return Flexible(
//                      child: GestureDetector(
//                          onTap: () {
//                          this.onItemSelected(index);
//                          },
//                          child: _buildItem(
//                              item, selectedIndex == index),
//                      ),
//                      );
//                  }).toList(),
//                  ),
//              ),
//              );
//          }
//      }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/homeScreen.dart';
import '../screens/myplan_screen.dart';

class narBar extends StatefulWidget {
  const narBar({super.key});

  @override
  State<narBar> createState() => _navbarstate();
}

class _navbarstate extends State<narBar> {
  int index = 0;
  final screens = [
    const HomeScreenn(),
    MyPlansScreen(),
    MyPlansScreen(),
    MyPlansScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.blue.shade100,
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            child: NavigationBar(
              height: 60,
              backgroundColor: Colors.grey,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                // screens[index],
                // ignore: prefer_const_literals_to_create_immutables
                NavigationBar(destinations: [
                  const NavigationDestination(
                      icon: Icon(Icons.home), label: 'Home'),
                  const NavigationDestination(
                      icon: Icon(Icons.favorite_border), label: 'Wishlist'),
                  const NavigationDestination(
                      icon: Icon(Icons.book), label: 'Plans'),
                  const NavigationDestination(
                      icon: Icon(Icons.person), label: 'Profile')
                ])
              ],
            )));
  }
}


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