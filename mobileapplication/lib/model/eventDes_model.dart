
import 'activity_model.dart';

class eventimgDestination {
  String imageUrl;

  eventimgDestination({
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': imageUrl,
    };
  }


}

List<eventimgDestination> eventdes = [
  eventimgDestination(
    imageUrl: 'assets/dogs.jpg',
  ),
  eventimgDestination(
    imageUrl: 'assets/bazar.png',
  ),

];