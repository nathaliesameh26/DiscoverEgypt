// import 'dart:async';
// // import 'package:filter_listview_example/api/books_api.dart';
// // import 'package:filter_listview_example/main.dart';
// // import 'package:filter_listview_example/model/book.dart';
// // import 'package:filter_listview_example/page/details.dart';
// // import 'package:filter_listview_example/page/search.dart';
// // import 'package:filter_listview_example/page/about.dart';
// // import 'package:filter_listview_example/widget/search_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:mobileapplication/screens/currentWeather.dart';

// import '../model/weather.dart';
// // import 'package:go_router/go_router.dart';

// class FilterNetworkListPage extends StatefulWidget {
//   @override
//   FilterNetworkListPageState createState() => FilterNetworkListPageState();
// }

// class FilterNetworkListPageState extends State<FilterNetworkListPage> {
//   List<Main> books = [];
//   String query = '';
//   Timer? debouncer;

//   @override
//   void initState() {
//     super.initState();

//     init();
//   }

//   Future init() async {
//     final books = await WeatherApi.getBooks(query);

//     setState(() => this.books = books.cast<Main>());
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//         ),
//         body: Column(
//           children: <Widget>[
//             // buildSearch(),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: books.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(books[index].temp.toString()),
//                     subtitle: Text(books[index].feelsLike.toString()),
//                     leading:
//                         const Icon(Icons.favorite_outlined, color: Colors.red),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       );

//   // Widget buildBook(Book book) => ListTile();
// }
