import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/model/destination_model.dart';

import 'package:mobileapplication/screens/addEvent.dart';
import 'package:mobileapplication/screens/detail_screen.dart';

import 'package:mobileapplication/screens/homeScreen.dart';
import 'package:mobileapplication/screens/register_screen.dart';
import 'package:mobileapplication/screens/home_screen.dart';
import 'package:mobileapplication/screens/adminpanel.dart';
import 'package:mobileapplication/screens/addPlace.dart';
import 'package:mobileapplication/screens/profile_page.dart';
import 'package:mobileapplication/screens/welcome.dart';
import 'package:mobileapplication/screens/wishlist_screen.dart';
import 'Searchplaces.dart';
import 'screens/destinantion_screen.dart';
// import 'eventPlannerForm.dart';
// import 'home.dart';
import 'screens/login_screen.dart';
import 'screens/myplan_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    //
    // ignore: prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/admin',
        // initialRoute: '/test',
        routes: {
          //'/': (context) => const HomeScreen(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/Searchplaces': (context) => const SearchPage(),
          '/admin': (context) => const adminpnel(),
          //'/evenetPlannerForm': (context) => Eventform(),
          '/homescreen': (context) => const HomeScreenn(),

          // '/homescreen': (context) => const HomeScreenn(),

          '/wishList': (context) => const WishList(),
          //'/myplans': (context) => const MyPlans(),
          '/welcome': (context) => const Welcome(),
          //'/destinationScreen': (context) => DestinationScreen(destination:),
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MyHomePage> {
  int index = 0;
  final screens = [
    //HomeScreen(),
    //DetailSreen(placeInfo: places[0]),
    DestinationScreen(
      destination: destinations[0],
    ),
    WishList(),
    //MyPlans(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("EgyMania"),
      ),
      endDrawer: Drawer(
          child: ListView(
        children: [
          ListTile(
              title: const Text('LogIn'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }),
          ListTile(
              title: const Text('Register'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Register()),
                );
              }),
          ListTile(title: Text('LogOut')),
          ListTile(
              title: const Text('AdminSide'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => adminpnel()),
                );
              }),
          ListTile(
              title: const Text('AdminSide - add places'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => placeform()),
                );
              }),
          ListTile(
              title: const Text('EventPlannerSide - add Event'),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Eventform()),
                // );
              }),
        ],
      )),
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
            destinations: [
              const NavigationDestination(
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
                  label: 'WishList'),
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
