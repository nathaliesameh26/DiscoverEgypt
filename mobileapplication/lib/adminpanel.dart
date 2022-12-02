import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileapplication/addPlace.dart';

class adminpanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return adminpanelState();
  }
}

class adminpanelState extends State<adminpanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        buildTop(),
        buildContent(),
      ],
    ));
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 15),
          const Text(
            'Fahd Willams',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Flutter software engineer and developer',
            style: TextStyle(fontSize: 20, height: 1.4, color: Colors.black),
          ),
          const SizedBox(
            height: 2,
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          NumbersWidget(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox.fromSize(
                size: const Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: const Color.fromARGB(255, 64, 185, 255),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 235, 240, 235),
                      onTap: () {
                        Navigator.pushNamed(context, '/placeform');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.add),
                          const Text("Add Place",
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: const Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: const Color.fromARGB(255, 64, 185, 255),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 235, 240, 235),
                      onTap: () {
                        Navigator.pushNamed(context, '/pendingList');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.list),
                          const Text("Pending List",
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: const Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: const Color.fromARGB(255, 64, 185, 255),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 235, 240, 235),
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.add),
                          const Text("Add Events",
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox.fromSize(
                size: const Size(70, 70),
                child: ClipOval(
                  child: Material(
                    color: const Color.fromARGB(255, 64, 185, 255),
                    child: InkWell(
                      splashColor: Color.fromARGB(255, 235, 240, 235),
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.person),
                          const Text("Users",
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          buildAbout(),
        ],
      );
  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('About',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          // ignore: prefer_const_constructors
          Text(
            'In here you can find everything you can do like adding sightseeing places , approving or disapproving events , application users and more',
            style: const TextStyle(fontSize: 18, height: 1.4),
          )
        ]),
      );

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: buildCoverImage(),
        ),
        Positioned(
          top: 180,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => Container(
        child: Image.asset(
          'assets/background4.jpg',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: 144 / 2,
        backgroundColor: Colors.grey.shade800,
        // child: Image.asset(
        //   'assets/profile.jpg',
        //   width: double.infinity,
        //   height: double.infinity,
        // )
        // backgroundImage: const NetworkImage(
        //   'https://picsum.photos/id/1074/400/400',
        // ),
      );
}

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        buildButton(text: 'Users', value: 100),
        buildDivider(),
        buildButton(text: 'Planners', value: 30),
        buildDivider(),
        buildButton(text: 'Places and Events', value: 50000),
        buildDivider(),
      ]);
}

Widget buildDivider() => Container(
      height: 24,
      child: const VerticalDivider(),
    );

Widget buildButton({
  required String text,
  required int value,
}) =>
    MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '$value',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              const SizedBox(height: 1),
              Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ]));


  // Widget buildSocialIcon(IconData icon) => CircleAvatar(
  //     radius: 25,
  //     child: Material(
  //         shape: const CircleBorder(),
  //         clipBehavior: Clip.hardEdge,
  //         color: Colors.transparent,
  //         child: InkWell(
  //           onTap: () {},
  //         )));



              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.add,
              //     size: 20.0,
              //   ),
              //   label: const Text('Event'),
              // ),
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.list,
              //     size: 20.0,
              //   ),
              //   label: const Text('Pending List'),
              // ),
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.add,
              //     size: 20.0,
              //   ),
              //   label: const Text('Sight'),
              // ),

              // buildSocialIcon(FontAwesomeIcons.plane),
              // const SizedBox(height: 12),
              // // buildSocialIcon(FontAwesomeIcons.plane),
              // // const SizedBox(height: 12),
              // // buildSocialIcon(FontAwesomeIcons.cartArrowDown),
              // // const SizedBox(height: 12),