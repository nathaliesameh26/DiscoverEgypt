// import 'package:flutter/material.dart';


// BottomNavigationBar buildNavBar(BuildContext context) {
//   class MyHomePage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MyHomePage> {
//    int index = 0;
//   final screens = [
//     Center(
//       child: Text(
//         'Page 1',
//         style: TextStyle(fontSize: 72),
//       ),
//     ),
//     Center(
//       child: Text(
//         'Page 2',
//         style: TextStyle(fontSize: 72),
//       ),
//     ),
//     Center(
//       child: Text(
//         'Page 3',
//         style: TextStyle(fontSize: 72),
//       ),
//     ),
//     Center(
//       child: Text(
//         'Page 4',
//         style: TextStyle(fontSize: 72),
//       ),
//     ),
//     Center(
//       child: Text(
//         'Page 5',
//         style: TextStyle(fontSize: 72),
//       ),
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text("EgyMania"),
//       ),
//       endDrawer: Drawer(
//           child: ListView(
//         children: [
//           DrawerHeader(
//             child: Text('Drawer Header'),
//             decoration: BoxDecoration(color: Colors.orange),
//           ),
//           ListTile(title: Text('item1')),
//           ListTile(title: Text('item2')),
//         ],
//       )),
//       body: screens[index],
//       // body: Container(
//       //     decoration: BoxDecoration(
//       //         image: DecorationImage(
//       //   image: NetworkImage(backgroundimage),
//       //   fit: BoxFit.cover,

//       // ))),

//       bottomNavigationBar: NavigationBarTheme(
//           data: NavigationBarThemeData(
//               indicatorColor: Colors.orange,
//               labelTextStyle: MaterialStateProperty.all(
//                 TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               )),
//           child: NavigationBar(
//             height: 60,
//             backgroundColor: Colors.transparent,
//             labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
//             selectedIndex: index,
//             onDestinationSelected: (index) =>
//                 setState(() => this.index = index),
//             destinations: [
//               NavigationDestination(
//                   icon: Icon(Icons.tour_outlined),
//                   selectedIcon: Icon(Icons.tour_rounded),
//                   label: 'Explore'),
//               NavigationDestination(
//                   icon: Icon(Icons.event_available_outlined),
//                   selectedIcon: Icon(Icons.event_available_rounded),
//                   label: 'Events'),
//               NavigationDestination(
//                   icon: Icon(Icons.favorite_border_outlined),
//                   selectedIcon: Icon(Icons.favorite),
//                   label: 'Wish List'),
//               NavigationDestination(
//                   icon: Icon(Icons.map_outlined),
//                   selectedIcon: Icon(Icons.map),
//                   label: 'My Plans'),
//               NavigationDestination(
//                   icon: Icon(Icons.account_box_outlined),
//                   selectedIcon: Icon(Icons.account_box_rounded),
//                   label: 'Account'),
//             ],
//           )),
//     );
//   }
// };
// }
