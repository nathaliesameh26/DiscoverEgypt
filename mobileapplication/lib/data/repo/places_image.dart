import 'package:cloud_firestore/cloud_firestore.dart';

class TopSights {
  Stream<QuerySnapshot> getTopSights(String name) {
    return FirebaseFirestore.instance
        .collection('placesimage')
        .where('name', isEqualTo: name)
        .snapshots();
  }
}
