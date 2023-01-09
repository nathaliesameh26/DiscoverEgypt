import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class googleNavbar extends StatefulWidget {
  const googleNavbar({super.key});

  @override
  State<googleNavbar> createState() => _googleNavbarState();
}

class _googleNavbarState extends State<googleNavbar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: GNav(
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
    );
  }
}
