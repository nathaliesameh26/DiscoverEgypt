import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
        'name' :country,
 'desc':description,
 'city':city,
 'activite':activities,
  'img':imageUrl,
    };
  }

  // factory Destination.fromMap(Map<String, dynamic> map) {
  //   return Destination(
  //     city: map['name'] as String,
  //     country: map['about'] as String,
  //      imageUrl: map['city'] as String,
  //     description: map['location'] as String,
  //     //  activities: map['openingtime'] as List,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Destination.fromJson(String source) =>
  //     Destination.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/pyra.jpg',
    name: 'The Pyramids',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '4:00 pm'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/alex.jpg',
    name: 'Musem of Egypt',
    type: 'Sightseeing Tour',
    startTimes: ['1:00 pm', '3:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Saqqara Pyramids',
    type: 'Sightseeing Tour',
    startTimes: ['2:30 pm', '6:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/pyra.jpg',
    city: 'Cairo',
    country: 'Egypt',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/LuxAndAswan.jpg',
    city: 'Luxor and Aswan',
    country: 'Egypt',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/alex.jpg',
    city: 'Alexandria',
    country: 'Egypt',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/fayoum.jpg',
    city: 'Fayoum',
    country: 'Egypt',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];

// class PlacesData {
//   Future<Object> getDestinationDetails() async {
//     // final user = FirebaseAuth.instance.currentUser!;
//     // String userIds = user.uid;
//     final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//         .collection('places')
//         .doc('opzKllKvtUrfDxCXxPk9')
//         .get();
//     return documentSnapshot;
//   }
// }
