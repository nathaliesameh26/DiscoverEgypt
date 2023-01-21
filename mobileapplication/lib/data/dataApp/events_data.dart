import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//--------------------------Connecting With Firebase ---------------------------//
//functions start it lower cases
class PlacesData {
  Stream<QuerySnapshot> EventDetails() {
    return FirebaseFirestore.instance.collection('events').snapshots();
  }

  Future updateEventDetails(
    String id,
    String name,
    String about,
    String city,
    String price,
    String location,
    String openingTime,
    String closingTime,
    String startdate,
    String enddate,
  ) async {
    final eventRef = FirebaseFirestore.instance.collection('events');
    final eventQuery = eventRef.doc(id);
    // final eventQuery = eventRef.where('name', isEqualTo: name);
    final eventSnapshot = await eventQuery.get();

    eventSnapshot.reference.update({
      'name': name,
      'about': about,
      'price': price,
      'location': location,
      'city': city,
      'startdate': startdate,
      'enddate': enddate,
      'openingTime': openingTime,
      'closingTime': closingTime,
    });
  }

  Future deleteEvent({required String id}) async {
    FirebaseFirestore.instance.collection("events").doc(id).delete();
  }

  Future PlaceAdded({
    required String name,
    required String about,
    required String city,
    required String price,
    required String startdate,
    required String enddate,
    required String location,
    required String openingTime,
    required String closingTime,
  }) async {
    //create a document to get its ID
    final newDocument = FirebaseFirestore.instance.collection('events').doc();
    await FirebaseFirestore.instance
        .collection('events')
        .doc(newDocument.id)
        .set({
      "name": name,
      "about": about,
      "city": city,
      "price": int.parse(price),
      "location": location,
      "startdate": startdate,
      "enddate": enddate,
      "openingTime": openingTime,
      "closingTime": closingTime,
    });
  }
}
