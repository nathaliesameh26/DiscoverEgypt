import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  // List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    // required this.activities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': country,
      'desc': description,
      'city': city,
      // 'activite': activities,
      'img': imageUrl,
    };
  }

  
}

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/pyra.jpg',
    city: 'Cairo',
    country: 'Egypt',
    description:
        'Visit the pyramids to see one of the Seven Wonders of the World',
    // activities: activities,
  ),
  Destination(
    imageUrl: 'assets/LuxAndAswan.jpg',
    city: 'Luxor and Aswan',
    country: 'Egypt',
    description:
        'Visit Luxor and aswan for an amazing and unforgettable adventure.',
    // activities: activities,
  ),
  Destination(
    imageUrl: 'assets/alex.jpg',
    city: 'Alexandria',
    country: 'Egypt',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    // activities: activities,
  ),
  Destination(
    imageUrl: 'assets/fayoum.jpg',
    city: 'Fayoum',
    country: 'Egypt',
    description:
        'Visit fayoum one of the most beautiful and fertile regions of Egypt',
    // activities: activities,
  ),
];



