class PlaceInfo {
  final String location, image, name, desc, price, time;

  PlaceInfo({
    required this.name,
    required this.price,
    required this.desc,
    required this.location,
    required this.image,
    required this.time,
  });
}

List places = [
  PlaceInfo(
      image: 'assets/kyaking.jpg',
      location: 'zamalek',
      time: "9AM",
      name: 'Kyaking',
      desc:
          'This is a fun activity that involves moving through water in a small water vessel with the aid of a double-bladed paddle',
      price: "200 Dollar"),
  PlaceInfo(
      image: 'assets/kamel.jpg',
      location: 'Giza',
      time: "11AM",
      name: 'Riding kamels&hourses',
      desc:
          'Enjoy a camel ride at Giza Pyramids for 2 hours during the sun rise or sun set. Mount a camel and ride it through the desert to the base of the Great Pyramid.',
      price: "150 Dollar"),
  PlaceInfo(
      image: 'assets/luxor.jpg',
      location: 'luxor',
      time: "9AM",
      name: 'luxor temple',
      desc:
          ' one of the oldest and most inhabited cities on earth, the capital of the pharaohs in Ancient Egypt.',
      price: "2000 Dollar"),
  PlaceInfo(
      image: 'assets/pyramids.jpg',
      location: 'Giza',
      time: "12AM",
      name: 'pyramids',
      desc:
          '  the worlds oldest monumental structures constructed of dressed masonry',
      price: "300 Dollar")
];
