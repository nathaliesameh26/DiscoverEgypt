import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

// final place = FirebaseAuth.instance.currentUser!;
// String placeID = place.uid;
// String myDocId = 'place.uid';
DocumentSnapshot? documentSnapshot;

late DocumentReference _documentReference;
late Future<DocumentSnapshot> _futureDocument;

class PlacesData {
  Future PlaceDetails() async {
    final QuerySnapshot places =
        await FirebaseFirestore.instance.collection('places').get();
    return places;
  }

// Future deletePlace(String id) async {
//   _documentReference = FirebaseFirestore.instance.collection('place')
//   .doc(id);
//   _futureDocument = _documentReference.get();
//   _documentReference.delete();
// }

  // Future getSpecificPlace() async {
  //   final QuerySnapshot places = await FirebaseFirestore.instance
  //       .collection('places')
  //       .where('city', arrayContains: 'Cairo')
  //       .get();
  //   return places;
  // }

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

    await FirebaseFirestore.instance
        .collection('places')
        .where("name", isEqualTo: name)
        .get()
        .then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        FirebaseFirestore.instance
            .collection('places')
            .doc(result.id)
            .update(toMap());
      }
    });
  }

// final UpdatePlace = FirebaseFirestore.instance
//     .collection('places')
//     // .doc(name)
//     .where('name', isEqualTo: name)
//     .snapshots();

// .updatePlace.update({
//   "name": name.trim(),
//   "about": about.trim(),
//   "city": city.trim(),
//   "price": int.parse(price.trim()),
//   "openingTime": openingTime.trim(),
//   "closingTime": closingTime.trim(),}
// );
}

Future deletePlace(String id) async {
  FirebaseFirestore.instance.collection("places").doc(id).delete();
  // DocumentReference docRef =
  //     FirebaseFirestore.instance
  //     .collection('places')
  //     .doc(id);
  // docRef.delete();

  //FirebaseFirestore.instance.collection('places').doc('id').delete();
  // await FirebaseFirestore.instance
  //     .collection('place')
  //     .where('name', isEqualTo: name)
  //     .delete();
  //update({name: FieldValue.delete()}).whenComplete(() {
  // print('Field Deleted');
}

// final placeid = int.parse(id);
// FirebaseFirestore.instance.collection("places").doc(name).delete();

//   DocumentReference docRef = FirebaseFirestore.instance.collection('places').doc();
// print(docRef.documentID);
// docRef.setData({JSON Data});

// DocumentReference doc_ref=FirebaseFirestore.instance.collection("places").doc(doc_id);
// DocumentSnapshot docSnap = await doc_ref.get();
// var doc_id = docSnap.reference.documentID;

// deleteDocument(String documentId) async {
//   try {
//     await FirebaseFirestore.instance
//         .collection('places')
//         .doc(documentId)
//         .delete();
//     print('Document successfully deleted!');
//   } catch (e) {
//     print('Error deleting document: $e');
//   }
// }

Future placeAdded(String name, String about, String city, String price,
    String openingTime, String closingTime) async {
  await FirebaseFirestore.instance.collection('places').add({
    "name": name,
    "about": about,
    "city": city,
    "price": int.parse(price),
    "openingTime": openingTime,
    "closingTime": closingTime,
    // "id" :place,
    // "location": location,
  });

  // print('New places is added');
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.setString('id', placeID);
}
// }

// Future deletePlace(String name) async {
//   // final placeid = int.parse(id);
//   FirebaseFirestore.instance.collection("places").doc(name).delete();
// }

class PlacesModel {
  String? name;
  String? location;
  String? description;
  int? price;

  PlacesModel(this.name, this.location, this.description, this.price);
}

// Future deletePlace(String id) async {
//   _documentReference = FirebaseFirestore.instance.collection('place')
//   .doc(id);
//   _futureDocument = _documentReference.get();
//   _documentReference.delete();
// }
