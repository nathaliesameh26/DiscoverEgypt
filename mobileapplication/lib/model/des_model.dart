
import 'activity_model.dart';

class imgDestination {
  String imageUrl;

  imgDestination({
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': imageUrl,
    };
  }


}

// List<ImgActivity> act = [
//   ImgActivity(
//     imageUrl: 'assets/pyra.jpg',
//   ),
//   ImgActivity(
//     imageUrl: 'assets/alex.jpg',
//   ),
//   ImgActivity(
//     imageUrl: 'assets/images/murano.jpg',
//   ),
// ];

List<imgDestination> des = [
  imgDestination(
    imageUrl: 'assets/LuxAndAswan.jpg',
  ),
  imgDestination(
    imageUrl: 'assets/luxor.jpg',
  ),
  imgDestination(
    imageUrl: 'assets/sound.jpeg',
  ),
  imgDestination(
    imageUrl: 'assets/alex.jpg',
  ),
];