import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repo/place_provider_test.dart';
import '../data/repo/places_provider.dart';

class DetailsPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsPageState();
  //static final String path = "lib/src/pages/hotel/details.dart";
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  double rating = 0;
  TextEditingController nameController = TextEditingController();
  final String image = "assets/Egypt.jpg";
  @override
  Widget build(BuildContext context) {
    final PlacesData = ref.watch(placesDataProvider);
    final index = ModalRoute.of(context)!.settings.arguments;

    //final placeData1 = ref.watch(placesDataProvider1);
    return Scaffold(
      body: PlacesData.when(
        data: (value) => SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                  foregroundDecoration: BoxDecoration(color: Colors.black26),
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(image, fit: BoxFit.fill)),
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 250),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "${value.docs[index].get('name')}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 16.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            "${value.docs[index].get('location')} reviews",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(32.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Text('your rating:$rating'),
                                        RatingBar.builder(
                                          minRating: 1,
                                          itemBuilder: ((context, _) =>
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              )),
                                          updateOnDrag: true,
                                          onRatingUpdate: (rating) =>
                                              setState(() {
                                            this.rating = rating;
                                          }),
                                        ),
                                      ],
                                      // children: const <Widget>[
                                      //   Icon(
                                      //     Icons.star,
                                      //     color: Colors.blue,
                                      //   ),
                                      //   Icon(
                                      //     Icons.star,
                                      //     color: Colors.blue,
                                      //   ),
                                      //   Icon(
                                      //     Icons.star,
                                      //     color: Colors.blue,
                                      //   ),
                                      //   Icon(
                                      //     Icons.star,
                                      //     color: Colors.blue,
                                      //   ),
                                      //   Icon(
                                      //     Icons.star_border,
                                      //     color: Colors.blue,
                                      //   ),
                                      // ],
                                    ),
                                    Text.rich(
                                      TextSpan(children: [
                                        const WidgetSpan(
                                            child: Icon(
                                          Icons.location_on,
                                          size: 16.0,
                                          color: Colors.grey,
                                        )),
                                        TextSpan(
                                            text:
                                                "${value.docs[index].get('location')}")
                                      ]),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${value.docs[index].get('price')} LE",
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  const Text(
                                    "/per Trip",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 32.0,
                                ),
                              ),
                              child: const Text(
                                "Book Now",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/booking',
                                    arguments: index);
                              },
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Text(
                            "Description".toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14.0),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "${value.docs[index].get('about')}",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14.0),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "DETAIL",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  selectedItemColor: Colors.black,
                  items: [
                    BottomNavigationBarItem(
                        backgroundColor: Colors.blue,
                        icon: Icon(Icons.search),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border), label: "Favorites"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.book_sharp), label: "My Plans"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Profile"),
                  ],
                ),
              )
            ],
          ),
        ),
        error: (Object error, StackTrace stackTrace) {},
        loading: () {},
      ),
    );
  }
}
