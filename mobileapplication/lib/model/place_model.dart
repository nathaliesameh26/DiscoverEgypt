class PlaceInfo {
  final String location, image, name, desc, time, price;

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
      time: "9 am",
      name: 'Kyaking',
      desc:
          'This is a fun activity that involves moving through water in a small water vessel with the aid of a double-bladed paddle',
      price: "100 Dollars"),
  PlaceInfo(
      image: 'assets/kamel.jpg',
      location: 'Giza',
      time: "1 AM",
      name: 'Riding Camels&hourses',
      desc:
          'Enjoy a camel ride at Giza Pyramids for 2 hours during the sun rise or sun set. Mount a camel and ride it through the desert to the base of the Great Pyramid.',
      price: "50 Dollars"),
  PlaceInfo(
      image: 'assets/luxor.jpg',
      location: 'luxor',
      time: "1AM",
      name: 'luxor temple',
      desc:
          ' one of the oldest and most inhabited cities on earth, the capital of the pharaohs in Ancient Egypt.',
      price: "1000 Dollars"),
  PlaceInfo(
      image: 'assets/pyramids.jpg',
      location: 'Giza',
      time: "9Am",
      name: 'pyramids',
      desc:
          '  the worlds oldest monumental structures constructed of dressed masonry',
      price: "200 Dollars")
];
