import 'dart:convert';
import 'dart:core';

class WishlistModel {
  String name;
  String about;
  String location;
  String price;

  WishlistModel(
      {required this.name,
      required this.about,
      required this.location,
      required this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'about': about,
      'location': location,
      'price': price
    };
  }

  factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      name: map['name'] as String,
      about: map['about'] as String,
      location: map['location'] as String,
      price: map['startdate'] as String,

    );
  }

  String toJson() => json.encode(toMap());

  factory WishlistModel.fromJson(String source) =>
      WishlistModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final event = FirebaseAuth.instance.currentUser!;
// String eventID = event.uid;

// //--------------------------Connecting With Firebase ---------------------------//

// class EventsData {
//   // ignore: non_constant_identifier_names
//   Future EventDetails() async {
//     final QuerySnapshot events =
//         await FirebaseFirestore.instance.collection('events').get();
//     return events;
//   }
//   // Future<Object> EventDetails() async {
//   //   final event = FirebaseAuth.instance.currentUser!;
//   //   String eventID = event.uid;
//   //   final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//   //       .collection('events')
//   //       .doc('9qKBFY73oJbMnjgXpznB')
//   //       .get();
//   //   return documentSnapshot;
//   // }

//   Future<void> updateEventDetails(
//     String name,
//     String about,
//     String city,
//     String location,
//     String price,
//     String StartDate,
//     String EndDate,
//     String openingTime,
//     String closingTime,
//   ) async {
//     Map<String, dynamic> toMap() {
//       return {
//         'name': name,
//         'about': about,
//         'price': price,
//         'location': location,
//         'city': city,
//         'startDate': StartDate,
//         'endDate': EndDate,
//         'openingtime': openingTime,
//         'closingtime': closingTime,
//       };
//     }

//     await FirebaseFirestore.instance
//         .collection('events')
//         .where("name", isEqualTo: name)
//         .get()
//         .then((querySnapshot) {
//       for (var result in querySnapshot.docs) {
//         FirebaseFirestore.instance
//             .collection('events')
//             .doc(result.id)
//             .update(toMap());
//       }
//     });
//   }

// //-------------------------------Adding New Event to firebase --------------------------//
// }

// Future EventAdded(
//   String name,
//   String about,
//   String city,
//   String price,
//   String openingTime,
//   String closingTime,
//   String startdate,
//   String enddate,
//   //String rating,
//   String location,
// ) async {
//   await FirebaseFirestore.instance.collection('events').add({
//     "name": name,
//     "about": about,
//     "city": city,
//     "price": int.parse(price),
//     "openingTime": openingTime,
//     "closingTime": closingTime,
//     "startdate": startdate,
//     "enddate": enddate,
//     //"rating": int.parse(rating),
//     "location": location,
//     // "id" :place,
//     // "location": location,
//   });

//   // print('New places is added');
//   // final prefs = await SharedPreferences.getInstance();
//   // await prefs.setString('id', placeID);
// }

// // Future addevent({
// //   required String name,
// //   required String about,
// //   required String city,
// //   required String location,
// //   required int price,
// //   required int rating,
// //   required String startdate,
// //   required String enddate,
// //   required String openingtime,
// //   required String closingtime,
// // }) async {
// //   await FirebaseFirestore.instance.collection('events').doc(eventID).set({
// //     "name": name,
// //     "about": about,
// //     "city": city,
// //     "location": location,
// //     "price": price,
// //     "startdate": startdate,
// //     "enddate": enddate,
// //     "openingtime": openingtime,
// //     "closingtime": closingtime,
// //   });

// //   print('New event is added');
// //   final prefs = await SharedPreferences.getInstance();
// //   await prefs.setString('EVENT_ID', eventID);
// // }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// class WishList with ChangeNotifier {
//   addWishListData({
//     required String wishListId,
//     required String wishListName,
//     var wishListPrice,
//     required String wishListImage,
//     required int wishListQuantity,
//   }) {
//     FirebaseFirestore.instance
//         .collection("WishList")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection("YourWishList")
//         .doc(wishListId)
//         .set({
//       "wishListId": wishListId,
//       "wishListName": wishListName,
//       "wishListImage": wishListImage,
//       "wishListPrice": wishListPrice,
//       "wishListQuantity": wishListQuantity,
//       "wishList": true,
//     });
//   }

// ///// Get WishList Data ///////
//   // List<ProductModel> wishList = [];

//   // getWishtListData() async {
//   //   List<ProductModel> newList = [];
//   //   QuerySnapshot value = await FirebaseFirestore.instance
//   //       .collection("WishList")
//   //       .doc(FirebaseAuth.instance.currentUser.uid)
//   //       .collection("YourWishList")
//   //       .get();
//   //   value.docs.forEach(
//   //     (element) {
//   //       ProductModel productModel = ProductModel(
//   //         productId: element.get("wishListId"),
//   //         productImage: element.get("wishListImage"),
//   //         productName: element.get("wishListName"),
//   //         productPrice: element.get("wishListPrice"),
//   //         productQuantity: element.get("wishListQuantity"),
//   //       );
//   //       newList.add(productModel);
//   //     },
//   //   );
//   //   wishList = newList;
//   //   notifyListeners();
//   // }

//   // List<ProductModel> get getWishList {
//   //   return wishList;
//   // }

//   Future getWishListData() async {
//     final QuerySnapshot events =
//         await FirebaseFirestore.instance.collection('wishlist').get();
//     return events;
//   }
//   // Future<Object> EventDetails() async {
//   //   final event = FirebaseAuth.instance.currentUser!;
//   //   String eventID = event.uid;
//   //   final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//   //       .collection('events')
//   //       .doc('9qKBFY73oJbMnjgXpznB')
//   //       .get();
//   //   return documentSnapshot;
//   // }

// ////////// Delete WishList /////
//   deleteWishtList(wishListId) {
//     FirebaseFirestore.instance
//         .collection("WishList")
//         .doc(FirebaseAuth.instance.currentUser?.uid)
//         .collection("YourWishList")
//         .doc(wishListId)
//         .delete();
//   }
// }
