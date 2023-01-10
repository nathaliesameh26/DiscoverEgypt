import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final event = FirebaseAuth.instance.currentUser!;
String eventID = event.uid;

class EventsData {
  // ignore: non_constant_identifier_names
  Future<Object> EventDetails() async {
    final event = FirebaseAuth.instance.currentUser!;
    String eventID = event.uid;
    final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('events')
        .doc('9qKBFY73oJbMnjgXpznB')
        .get();
    return documentSnapshot;
  }
}

Future addevent({
  required String name,
  required String about,
  required String city,
  required String location,
  required int price,
  required int rating,
  required String startdate,
  required String enddate,
  required String openingtime,
  required String closingtime,
}) async {
  await FirebaseFirestore.instance.collection('events').doc(eventID).set({
    "name": name,
    "about": about,
    "city": city,
    "location": location,
    "price": price,
    "startdate": startdate,
    "enddate": enddate,
    "openingtime": openingtime,
    "closingtime": closingtime,
  });

  print('New event is added');
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EVENT_ID', eventID);
}
