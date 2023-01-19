// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final pendingEvent = FirebaseAuth.instance.currentUser!;
// String pendingEID = pendingEvent.uid;

// class PendingData {
//   // ignore: non_constant_identifier_names

//   Future PendingDetails() async {
//     final QuerySnapshot pendingEvent =
//         await FirebaseFirestore.instance.collection('pending').get();
        
//     return pendingEvent;
//   }

//   // Future<Object> PendingDetails() async {
//   //   final pendingEvent = FirebaseAuth.instance.currentUser!;
//   //   String pendingEID = pendingEvent.uid;
//   //   final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//   //       .collection('pending')
//   //       .doc('j4YSu0J2ZGfaGKDMbswb')
//   //       .get();
//   //   return documentSnapshot;
//   // }
// }

// // class PendingModel {
// //   String? name;
// //   String? location;
// //   String? about;
// //   int? price;

// //   PendingModel(this.name, this.location, this.about, this.price);
// // }


// // Future addEvent({
// //   required String name,
// //   required String about,
// //   required String location,
// //   required int price,
// //   required int rating,
// //   required String openingtime,
// //   required String closingtime,
// // }) async {
// //   await FirebaseFirestore.instance.collection('events').doc(pendingEID).set({
// //     "name": name,
// //     "about": about,
// //     "location": location,
// //     "price": price,
// //     "rating": rating,
// //     "openingtime": openingtime,
// //     "closingtime": closingtime,
// //   });

// //   print('New event is added');
// //   final prefs = await SharedPreferences.getInstance();
// //   await prefs.setString('PLACE_ID', pendingEID);
// // }
