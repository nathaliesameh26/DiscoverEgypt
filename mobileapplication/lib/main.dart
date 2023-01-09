import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/repo/favorite_provider.dart';
import 'package:mobileapplication/model/destination_model.dart';
import 'package:mobileapplication/screens/addEvent.dart';
import 'package:mobileapplication/screens/booking_screen.dart';
import 'package:mobileapplication/screens/detail_screen.dart';
import 'package:mobileapplication/screens/homeScreen.dart';
import 'package:mobileapplication/screens/pending_screen.dart';
import 'package:mobileapplication/screens/register_screen.dart';
import 'package:mobileapplication/screens/adminpanel.dart';
import 'package:mobileapplication/screens/addPlace.dart';
import 'package:mobileapplication/screens/profile_page.dart';
import 'package:mobileapplication/screens/welcome.dart';
import 'package:mobileapplication/screens/wishlist_screen.dart';
import 'screens/Search_screen.dart';
//import 'screens/Searchplaces.dart';
import 'screens/destinantion_screen.dart';
// import 'eventPlannerForm.dart';
// import 'home.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/welcome': (context) => const Welcome(),
          '/': (context) => const HomeScreenn(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/admin': (context) => const adminpnel(),
          '/evenetPlannerForm': (context) => Eventform(),
          '/wishList': (context) => const WishList(),
          '/detailsPage': (context) => DetailsPage(),
          '/splash': (context) => const Splash(),
          '/pending': (context) => PendingScreen(),
          '/Eventform': (context) => Eventform(),

          // '/myplans': (context) => const MyPlans(),
          // '/Searchplaces': (context) => const SearchPage(),
          //'/destinationScreen': (context) => DestinationScreen(destination:),
          //'/': (context) => const HomeScreen(),
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
