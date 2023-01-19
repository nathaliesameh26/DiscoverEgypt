import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/screens/Event_form.dart';
import 'package:mobileapplication/screens/Place_form.dart';
import 'package:mobileapplication/screens/Search_screen.dart';
import 'package:mobileapplication/screens/booking_screen.dart';
import 'package:mobileapplication/screens/detail_screen.dart';
import 'package:mobileapplication/screens/edit_delete_events.dart';
import 'package:mobileapplication/screens/edit_delete_places.dart';
import 'package:mobileapplication/screens/edit_place.dart';
import 'package:mobileapplication/screens/homeScreen.dart';
import 'package:mobileapplication/screens/pending_screen.dart';
import 'package:mobileapplication/screens/profile_page.dart';
import 'package:mobileapplication/screens/register_screen.dart';
import 'package:mobileapplication/screens/adminpanel.dart';
import 'package:mobileapplication/screens/welcome.dart';
import 'package:mobileapplication/screens/wishlist_screen.dart';
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

        initialRoute: '/register', routes: {

          '/welcome': (context) => const Welcome(),
          '/updatePlace': (context) => EditPlacePage(),
          '/': (context) => const HomeScreenn(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/admin': (context) => const AdminPanel(),
          // '/wishList': (context) => const WishList(),
          '/wishList': (context) => WishlistScreen(),
          '/detailsPage': (context) => DetailsPage(),
          '/addedplace': (context) => const placeForm(),
          // '/detail': (context) => const DetailSreen(),
          '/edevent': (context) => CrudEvent(),
          '/edplace': (context) => CrudPlace(),
          '/splash': (context) => const Splash(),
          '/pending': (context) => PendingScreen(),
          '/booking': (context) => BookingScreen(),
          '/Eventform': (context) => const eventForm(),
          '/search': (context) => SearchPage(),
          '/profile': (context) => ProfilePage(),
          // '/myplans': (context) => const MyPlans(),
          // '/Searchplaces': (context) => const SearchPage(),
          //'/destinationScreen': (context) => DestinationScreen(destination:),
        });
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MyHomePage> {
//   int index = 0;
//   final screens = [
//     //HomeScreen(),
//     //DetailSreen(placeInfo: places[0]),
//     DestinationScreen(
//       destination: destinations[0],
//     ),
//     const WishList(),
//     //MyPlans(),
//     ProfilePage()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: const Text("EgyMania"),
//       ),
//       endDrawer: Drawer(
//           child: ListView(
//         children: [
//           ListTile(
//               title: const Text('LogIn'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => const Login()),
//                 );
//               }),
//           ListTile(
//               title: const Text('Register'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => const Register()),
//                 );
//               }),
//           const ListTile(title: Text('LogOut')),
//           ListTile(
//               title: const Text('AdminSide'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => const adminpnel()),
//                 );
//               }),
//           ListTile(
//               title: const Text('AdminSide - add places'),
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => PlaceForm()),
//                 );
//               }),
//           ListTile(
//               title: const Text('EventPlannerSide - add Event'),
//               onTap: () {
//                 // Navigator.of(context).push(
//                 //   MaterialPageRoute(builder: (context) => Eventform()),
//                 // );
//               }),
//         ],
//       )),
    //   body: screens[index],
    //   bottomNavigationBar: NavigationBarTheme(
    //       data: NavigationBarThemeData(
    //           indicatorColor: Colors.orange,
    //           labelTextStyle: MaterialStateProperty.all(
    //             const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    //           )),
    //       child: NavigationBar(
    //         height: 60,
    //         backgroundColor: Colors.transparent,
    //         labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    //         selectedIndex: index,
    //         onDestinationSelected: (index) =>
    //             setState(() => this.index = index),
    //         // ignore: prefer_const_literals_to_create_immutables
    //         destinations: [
    //           const NavigationDestination(
    //               icon: Icon(Icons.tour_outlined),
    //               selectedIcon: Icon(Icons.tour_rounded),
    //               label: 'Explore'),
    //           const NavigationDestination(
    //               icon: Icon(Icons.event_available_outlined),
    //               selectedIcon: Icon(Icons.event_available_rounded),
    //               label: 'Events'),
    //           const NavigationDestination(
    //               icon: Icon(Icons.favorite_border_outlined),
    //               selectedIcon: Icon(Icons.favorite),
    //               label: 'WishList'),
    //           const NavigationDestination(
    //               icon: Icon(Icons.map_outlined),
    //               selectedIcon: Icon(Icons.map),
    //               label: 'My Plans'),
    //           const NavigationDestination(
    //               icon: Icon(Icons.account_box_outlined),
    //               selectedIcon: Icon(Icons.account_box_rounded),
    //               label: 'Account'),
    //         ],
    //       )),
    // );
 // }
//}
