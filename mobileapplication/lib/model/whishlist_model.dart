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
