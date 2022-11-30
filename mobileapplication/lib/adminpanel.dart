import 'package:flutter/material.dart';

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
        body: Stack(
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        //   Positioned(
        //     top: top,
        //     child : buildProfileImage(),
        //   )
        //   buildProfileImage(),
      ],
    ));
  }
}

Widget buildCoverImage() => Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/backgound.jpg"),
      //   ),
      // ),

      // child: Image.network(
      //   'https://picsum.photos/id/1074/400/400',
      child: Image.asset(
        'assets/kyaking.jpg',
        width: double.infinity,
        height: 280,
        fit: BoxFit.cover,
      ),
    );
Widget buildProfileImage() => CircleAvatar(
      radius: 144 / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(
        'https://picsum.photos/id/1074/400/400',
      ),
    );
