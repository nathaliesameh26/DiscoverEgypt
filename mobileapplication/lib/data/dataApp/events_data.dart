import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//--------------------------Connecting With Firebase ---------------------------//
//functions start it lower cases
class EventsData {
  Stream<QuerySnapshot> EventDetails() {
    return FirebaseFirestore.instance.collection('events').snapshots();
  }

  Future updateEventDetails(
    String id,
    String about,
    String city,
    String closingTime,
    String enddate,
    String location,
    String name,
    String openingTime,
    String plannerName,
    String price,
    String startdate,
  ) async {
    final eventRef = FirebaseFirestore.instance.collection('events');
    final eventQuery = eventRef.doc(id);
    // final eventQuery = eventRef.where('name', isEqualTo: name);
    final eventSnapshot = await eventQuery.get();

    eventSnapshot.reference.update({
      'about': about,
      'city': city,
      'closingTime': closingTime,
      'enddate': enddate,
      'location': location,
      'name': name,
      'openingTime': openingTime,
      'plannerName': plannerName,
      'price': price,
      'startdate': startdate,
    });
  }

  Future deleteEvent({required String id}) async {
    FirebaseFirestore.instance.collection("events").doc(id).delete();
  }

  Future eventAdded({
    required String name,
    required String plannerName,
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
      "plannerName": plannerName,
      "city": city,
      "price": int.parse(price),
      "location": location,
      "startdate": startdate,
      "enddate": enddate,
      "openingTime": openingTime,
      "closingTime": closingTime,
    });
  }

  Future eventAddedPlanner({
    required String name,
    required String plannerName,
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
    final newDocument = FirebaseFirestore.instance.collection('pending').doc();
    await FirebaseFirestore.instance
        .collection('pending')
        .doc(newDocument.id)
        .set({
      "name": name,
      "about": about,
      "plannerName": plannerName,
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
