import 'package:flutter/material.dart';
import 'package:mobileapplication/register.dart';
import 'package:mobileapplication/screens/home/home_screen.dart';
import 'package:mobileapplication/splash.dart';
import 'package:mobileapplication/profile_page.dart';
import 'package:mobileapplication/wishlist.dart';
import 'Searchplaces.dart';
import 'destinantion_screen.dart';
import 'eventPlannerForm.dart';
import 'home.dart';
import 'login.dart';
import 'myplan.dart';
import 'splash.dart';

//import 'detailspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/myplans',
        // initialRoute: '/test',
        routes: {
          '/': (context) => const HomeScreen(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          'home': (context) => Home(),
          '/Searchplaces': (context) => const SearchPage(),
          '/evenetPlannerForm': (context) => Eventform(),
          '/homescreen': (context) => const HomeScreen(),
          '/wishList': (context) => const WishList(),
          '/myplans': (context) => const MyPlans(),
          //'/destinationScreen': (context) => DestinationScreen(destination:),
        });
  }
}
