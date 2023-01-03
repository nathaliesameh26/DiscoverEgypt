import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaceInfo {
  final String location, image, name, desc, price, time;
}

Future addplace({
  required String name,
  required String about,
  required String location,
  required int price,
  required int rating,
  required String openingtime,
  required String closingtime,
}) async {
  await FirebaseFirestore.instance.collection('places').doc(placeID).set({
    "name": name,
    "about": about,
    "location": location,
    "price": price,
    "rating": rating,
    "openingtime": openingtime,
    "closingtime": closingtime,
  });

  print('New places is added');
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('PLACE_ID', placeID);
}
