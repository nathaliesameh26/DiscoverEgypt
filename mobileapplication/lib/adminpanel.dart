import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobileapplication/widget/numbers_widget.dart';

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
          const SizedBox(height: 8),
          Text(
            'Fahd Willams',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter software engnieer',
            style: TextStyle(fontSize: 20, height: 1.4, color: Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          // Container(
          //   // height: 200.0,
          //   decoration: new BoxDecoration(
          //     color: Colors.white,
          //     shape: BoxShape.circle,
          //   ),
          //   child: Center(
          //     child: Stack(
          //       // alignment: Alignment.center,
          //       children: <Widget>[
          //         Icon(
          //           Icons.play_arrow,
          //           color: Colors.black,
          //           size: 100.0,
          //         ),
          //         Text(
          //           "Play",
          //           style: TextStyle(fontSize: 18, color: Colors.black),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.download,
                      size: 15.0,
                    ),
                    label: Text('Download'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.download,
                      size: 15.0,
                    ),
                    label: Text('Download'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.download,
                      size: 15.0,
                    ),
                    label: Text('Download'),
                  ),
                ],
              )
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: Icon(
              //     Icons.download,
              //     size: 20.0,
              //   ),
              //   label: Text('Evente'),
              // ),
              // buildSocialIcon(FontAwesomeIcons.plane),
              // const SizedBox(height: 12),
              // // buildSocialIcon(FontAwesomeIcons.plane),
              // // const SizedBox(height: 12),
              // // buildSocialIcon(FontAwesomeIcons.cartArrowDown),
              // // const SizedBox(height: 12),
            ],
          ),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 16),
          NumbersWidget(),
          const SizedBox(height: 16),
          // buildAbout(),
        ],
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            // child: Center(child: Text()),
          )));

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30),
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
          'assets/background.jpg',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
      radius: 144 / 2,
      backgroundColor: Colors.grey.shade800,
      child: Image.asset(
        'assets/profile.jpg',
        width: double.infinity,
        height: double.infinity,
      )
      // backgroundImage: NetworkImage(
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
        buildButton(text: 'Places&Events', value: 500000),
        buildDivider(),
      ]);
}

Widget buildDivider() => Container(
      height: 24,
      child: VerticalDivider(),
    );

Widget buildButton({
  required String text,
  required int value,
}) =>
    MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '$value',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(height: 2),
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ]));
