import 'activity_model.dart';

class eventDestination {
  String imageUrl;
  String country;
  String description;
  List<Activity> activities;

  eventDestination({
    required this.imageUrl,
    required this.country,
    required this.description,
    required this.activities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': country,
      'desc': description,
      'activite': activities,
      'img': imageUrl,
    };
  }

 
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
    name: 'Museum of Egypt',
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

List<eventDestination> desevent = [
  eventDestination(
    imageUrl: 'assets/kyaking.jpg',
    country: 'Kayaking in Nile river ',
    description:
        'kayak in the nile with a beautiful view ',
    activities: activities,
  ),
  eventDestination(
    imageUrl: 'assets/spices.jpg',
    country: 'Spices Bazzar',
    description:
        'spices from all around the world will be available ',
    activities: activities,
  ),
  eventDestination(
    imageUrl: 'assets/run.jpeg',
    country: 'Cairo Runners',
    description: 'Wake up at 5am and run with the great view of te sun rise ',
    activities: activities,
  ),
];



