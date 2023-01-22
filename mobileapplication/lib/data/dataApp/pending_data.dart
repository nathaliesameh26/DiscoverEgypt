import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final pendingEvent = FirebaseAuth.instance.currentUser!;
String pendingEID = pendingEvent.uid;

class PendingData {
  // ignore: non_constant_identifier_names

  Stream<QuerySnapshot> pendingDetails() {
    return FirebaseFirestore.instance.collection('pending').snapshots();
  }

  Future deletePendingEvent({required String id}) async {
    FirebaseFirestore.instance.collection("pending").doc(id).delete();
  }

  Future pendingEventAdded({
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


}
