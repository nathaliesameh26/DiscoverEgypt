import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobileapplication/screens/events_carousel.dart';
import '../widget/navigation_bar.dart';
import '../widget/username_show.dart';
import 'destination_carousel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({super.key});

  @override
  State<HomeScreenn> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenn> {
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
                  : Color.fromARGB(15, 196, 189, 196),
              borderRadius: BorderRadius.circular(30)),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color.fromARGB(224, 0, 0, 0),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GNav(
        tabBackgroundColor: Colors.grey,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite_border,
            text: 'Favorites',
          ),
          GButton(
            icon: Icons.book,
            text: 'Plans',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
        title: UsernameShow(),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            const SizedBox(
              height: 20.0,
            ),
            EventCarousel(),
          ],
        ),
      ),
    );
  }
}
