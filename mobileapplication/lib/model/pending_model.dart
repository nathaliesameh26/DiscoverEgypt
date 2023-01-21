import 'dart:convert';
import 'dart:core';

class PendingModel {
  String name;
  String about;
  String city;
  String location;
  String startDate;
  String endDate;
  String openingTime;
  String closingTime;

  PendingModel(
      {required this.name,
      required this.about,
      required this.city,
      required this.location,
      required this.startDate,
      required this.endDate,
      required this.openingTime,
      required this.closingTime});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'about': about,
      'city': city,
      'location': location,
      'startDate': startDate,
      'endDate': endDate,
      'openingTime': openingTime,
      'closingTime': closingTime
    };
  }

  factory PendingModel.fromMap(Map<String, dynamic> map) {
    return PendingModel(
      name: map['name'] as String,
      about: map['about'] as String,
      city: map['city'] as String,
      location: map['location'] as String,
      startDate: map['startdate'] as String,
      endDate: map['enddate'] as String,
      openingTime: map['openingtime'] as String,
      closingTime: map['closingtime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PendingModel.fromJson(String source) =>
      PendingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

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
