import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

//--------------------------Connecting With Firebase ---------------------------//
//functions start it lower cases
class PlacesData {
  Stream<QuerySnapshot> placeDetails() {
    return FirebaseFirestore.instance.collection('places').snapshots();
  }

  Future updatePlaceDetails(
    String id,
    String name,
    String about,
    String city,
    String price,
    String location,
    String openingTime,
    String closingTime,
  ) async {
    final placeRef = FirebaseFirestore.instance.collection('places');
    final placeQuery = placeRef.doc(id);
    final placeSnapshot = await placeQuery.get();

    Future<void> updatePlaceDetails(
        String name,
        String about,
        String city,
        String location,
        String price,
        String openingTime,
        String closingTime) async {
      Map<String, dynamic> toMap() {
        return {
          'name': name,
          'about': about,
          'price': price,
          'location': location,
          'city': city,
          'openingtime': openingTime,
          'closingtime': closingTime,
        };
      }

      placeSnapshot.reference.update({
        'name': name,
        'about': about,
        'price': price,
        'location': location,
        'city': city,
        'openingTime': openingTime,
        'closingTime': closingTime,
      });
    }

    Future deletePlace({required String id}) async {
      FirebaseFirestore.instance.collection("places").doc(id).delete();
    }

    Future PlaceAdded({
      required String name,
      required String about,
      required String city,
      required String price,
      required String location,
      required String openingTime,
      required String closingTime,
    }) async {
      //create a document to get its ID
      final newDocument = FirebaseFirestore.instance.collection('places').doc();
      await FirebaseFirestore.instance
          .collection('places')
          .doc(newDocument.id)
          .set({
        "name": name,
        "about": about,
        "city": city,
        "price": int.parse(price),
        "location": location,
        "openingTime": openingTime,
        "closingTime": closingTime,
      });
    }
  }
}
