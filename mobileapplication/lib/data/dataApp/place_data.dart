import 'package:cloud_firestore/cloud_firestore.dart';

//--------------------------Connecting With Firebase ---------------------------//
//functions start it lower cases
class PlacesData {
  Stream<QuerySnapshot> placesDetails() {
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
    // final eventQuery = eventRef.where('name', isEqualTo: name);
    final placeSnapshot = await placeQuery.get();

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
    FirebaseFirestore.instance
        .collection("places")
        .doc(id)
        .delete();
  }


Future placeAdded({
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