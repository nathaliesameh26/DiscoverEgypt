import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/screens/Event_formAdmin.dart';
import 'package:mobileapplication/screens/Event_formPlanner.dart';
import 'package:mobileapplication/screens/Eventdetails_screen.dart';
import 'package:mobileapplication/screens/Place_form.dart';
import 'package:mobileapplication/screens/Planner_panel.dart';
import 'package:mobileapplication/screens/Search_screen.dart';
import 'package:mobileapplication/screens/auth_page.dart';
import 'package:mobileapplication/screens/booking_screen.dart';
import 'package:mobileapplication/screens/destination_carousel.dart';
import 'package:mobileapplication/screens/detail_screen.dart';
import 'package:mobileapplication/screens/edit_delete_events.dart';
import 'package:mobileapplication/screens/edit_delete_places.dart';
import 'package:mobileapplication/screens/edit_profile_page.dart';
import 'package:mobileapplication/screens/homeScreen.dart';
import 'package:mobileapplication/screens/myplan_screen.dart';
import 'package:mobileapplication/screens/pending_screen.dart';
import 'package:mobileapplication/screens/planner_events.dart';
import 'package:mobileapplication/screens/register_screen.dart';
import 'package:mobileapplication/screens/adminpanel.dart';
import 'package:mobileapplication/screens/test_screen.dart';
import 'package:mobileapplication/screens/welcome.dart';
import 'screens/RatingScreen.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash.dart';

import 'package:mobileapplication/screens/currentWeather.dart';

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
        //    color: Theme.of(context).primaryColor,
        initialRoute: '/planner',
        routes: {
          '/weather': (context) => CurrentWeatherPage(),
          '/admineventForm': (context) => const eventForm(),
          //'/testScreen': (context) => testScreen(),
          '/DestinationCarousel': (context) => DestinationCarousel(),
          '/raiting': (context) => const raiting(),
          '/welcome': (context) => const Welcome(),
          '/EditProfilePage': (context) => EditProfilePage(),
          '/CrudPlace': (context) => CrudPlace(),
          '/HomeScreenn': (context) => const HomeScreenn(),
          '/planner': (context) => PlannerPanel(),
          '/login': (context) => Login(),
          '/': (context) => const HomeScreenn(),
          '/eventdetails': (context) => EventDetailsPage(),
          '/register': (context) => const Register(),
          '/admin': (context) => const AdminPanel(),
          //'/wishList': (context) => WishlistScreen(),
          '/detailsPage': (context) => DetailsPage(),
          '/addedplace': (context) => PlacesForm(),
          '/eventList': (context) => CrudEvent(),
          '/placeList': (context) => CrudPlace(),
          '/splash': (context) => const Splash(),
          '/pending': (context) => PendingScreen(),
          '/booking': (context) => BookingScreen(),
          '/PlannerEvents': (context) => PlannerEvents(),
          '/addedeventplanner': (context) => const eventFormPlanner(),
          '/search': (context) => SearchPage(),
          '/profile': (context) => AuthPage(),
          '/plans': (context) => MyPlansScreen(),
          // '/DestinationScreen': (context) => DestinationScreen(),
          // '/updatePlace': (context) => EditPlacePage(),
          //'/updateEvent': (context) => EditEventPage(),
          // '/Searchplaces': (context) => const SearchPage(),
        }); //'/destinationScreen': (context) => DestinationScreen(destination:),
  }
}
