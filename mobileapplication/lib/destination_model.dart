import 'activity_model.dart';
//import 'destinantion_screen.dart';

class Destination {
  final String imageUrl;
  String city;
  final String country;
  final String description;
  final List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'The Pyramids',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '4:00 pm'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
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
    imageUrl: 'assets/images/venice.jpg',
    city: 'Cairo',
    country: 'Egypt',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Luxor and Aswan',
    country: 'Egypt',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'Alexandria',
    country: 'Egypt',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Fayoum',
    country: 'Egypt',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
