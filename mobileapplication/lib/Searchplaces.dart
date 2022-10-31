import 'package:flutter/material.dart';
import 'package:mobileapplication/main.dart';
import 'package:mobileapplication/places_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
//we are going to create a dummy list of places
// our own list for now.

  static List<PlacesModel> places_list = [
    PlacesModel('The Pyramids', 'Giza', 'Oldest Monuments in Egypt', 150),
    PlacesModel('Egyptian Museum ', 'Cairo',
        'Greatest Collection of ancient Egyptian artcrafts', 25),
    PlacesModel(
        'Egyptian Museum Citadel',
        'Cairo',
        'Citadel of Egyot where you can visist the Alabaster mosque of Mohamed Ali',
        35),
    PlacesModel('Fayoum Oasis', 'Fayoum-Egypt', 'Waterfalls', 140),
    PlacesModel('Dinner Cruise on the River Nile', 'Cairo', 'Cruise', 40),
  ];

//create the list that we aee going to display and filter
  List<PlacesModel> display_list = List.from(places_list);

  void updateList(String value) {
    //this is the function that will filter our list
    //we will be back to this list after
    //now let's write our search function
    setState(() {
      display_list = places_list
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(''), // You can add title here
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop('homes_creen'),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search for your favorite place",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 224, 234, 229),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: The Pyramids",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              // create a function display a text in case we don't get research
              child: display_list.isEmpty
                  ? const Center(
                      child: Text(
                      "Now Results found",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  : ListView.builder(
                      //child: ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            title: Text(display_list[index].name!,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Text(
                              '${display_list[index].description!}',
                              style: TextStyle(
                                  color: Color.fromARGB(153, 0, 0, 0)),
                            ),
                            trailing: Text(
                              "${display_list[index].price}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            // leading: Image.network(display_list[index].),
                          )),
            )
          ],
        ),
      ),
    );
  }
}
