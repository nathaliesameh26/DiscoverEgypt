import 'package:flutter/material.dart';
import 'package:mobileapplication/register.dart';
import 'package:mobileapplication/screens/home/home_screen.dart';
import 'package:mobileapplication/splash.dart';
import 'package:mobileapplication/profile_page.dart';
import 'Searchplaces.dart';
import 'eventPlannerForm.dart';
import 'home.dart';
import 'login.dart';
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
        initialRoute: '/homescreen',
        routes: {
          '/': (context) => Splash(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          'home': (context) => Home(),
          '/Searchplaces': (context) => SearchPage(),
          '/evenetPlannerForm': (context) => Eventform(),
          '/homescreen': (context) => HomeScreen(),
        });
  }
}
