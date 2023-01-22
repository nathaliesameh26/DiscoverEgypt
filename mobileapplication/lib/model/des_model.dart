

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