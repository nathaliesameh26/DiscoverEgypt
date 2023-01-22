//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobileapplication/data/dataApp/login_data.dart';

class WishList {
  // addWishListData({
  //   required String userId,
  //   required String placeId,
  //   required String placeName,
  //   required String placeLocation,
  //   required String placePrice,
  // }) {
  //   FirebaseFirestore.instance
  //       .collection("wishlist")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("YourWishList")
  //       .doc(userId)
  //       .set({
  //     "userId": userId,
  //     "placeId": placeId,
  //     "placeName": placeName,
  //     "placeLocation": placeLocation,
  //     "placePrice": placePrice,
  //     "wishList": true,
  //   });
  // }

///// Get WishList Data ///////

  Future getWishListData() async {
    final QuerySnapshot events = await FirebaseFirestore.instance
        .collection('wishlist')
        .where('userId', isEqualTo: userId)
        .get();
    return events;
  }

  Future getDataFromWishlist(placeId) async {
    final QuerySnapshot places = await FirebaseFirestore.instance
        .collection('places')
        .where('placeId', isEqualTo: placeId)
        .get();
    return places;
  }

  Future addToWishlist(
    String city,
    String name,
    String price,
    String userId,
    String placeId,
  ) async {
    final newDocument = FirebaseFirestore.instance.collection('wishlist').doc();
    await FirebaseFirestore.instance
        .collection('wishlist')
        .doc(newDocument.id)
        .set({
      "city": city,
      "name": name,
      "price": price,
      "userId": userId,
      //"placeId": placeId,
    });
  }

////////// Delete WishList /////
  deleteWishtList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
  }
}




 // List<ProductModel> wishList = [];

  // getWishtListData() async {
  //   List<ProductModel> newList = [];
  //   QuerySnapshot value = await FirebaseFirestore.instance
  //       .collection("WishList")
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .collection("YourWishList")
  //       .get();
  //   value.docs.forEach(
  //     (element) {
  //       ProductModel productModel = ProductModel(
  //         productId: element.get("wishListId"),
  //         productImage: element.get("wishListImage"),
  //         productName: element.get("wishListName"),
  //         productPrice: element.get("wishListPrice"),
  //         productQuantity: element.get("wishListQuantity"),
  //       );
  //       newList.add(productModel);
  //     },
  //   );
  //   wishList = newList;
  //   notifyListeners();
  // }

  // List<ProductModel> get getWishList {
  //   return wishList;
  // }




 // static Future<List<dynamic>> getWishlist(List <String> ids) async{
  //   for (var placeId in ids){
  //     try{
  //       await FirebaseFirestore.instance.collection('wishlist').doc(placeId).get().then((value) => ((QuerySnapshot)){

  //       });

  //     }
  //     catch(e){
  //       print('property ');
  //     }
  //   }
  // }
  // Future<Object> EventDetails() async {
  //   final event = FirebaseAuth.instance.currentUser!;
  //   String eventID = event.uid;
  //   final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //       .collection('events')
  //       .doc('9qKBFY73oJbMnjgXpznB')
  //       .get();
  //   return documentSnapshot;
  // }