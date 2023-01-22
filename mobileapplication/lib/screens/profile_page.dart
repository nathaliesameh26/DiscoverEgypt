// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mobileapplication/data/dataApp/user_data.dart';
// import 'package:mobileapplication/screens/edit_profile_page.dart';
// import 'package:mobileapplication/model/user_model.dart';
// import 'package:mobileapplication/widget/profile_widget.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;

//     return Scaffold(
//         //appBar: buildAppBar(context),
//         body: ListView(
//       physics: BouncingScrollPhysics(),
//       children: [
//         const SizedBox(height: 24),
//         ProfileWidget(
//           imagePath: user.photoURL!,
//           onClicked: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => EditProfilePage()),
//             );
//           },
//         ),
//         const SizedBox(height: 24),
//         buildName(),
//         const SizedBox(height: 48),
//         buildAbout(),
//       ],
//     ));
//   }

//   Widget buildName() => Column(
//         children: [
//           Text(
//             user.email!,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 4),
//           // Text(
//           //   user.email,
//           //   style: TextStyle(color: Colors.grey),
//           // )
//         ],
//       );

//   Widget buildAbout() => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text(
//             //   'About',
//             //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             // ),
//             // const SizedBox(height: 16),
//             // Text(
//             //   user.about,
//             //   style: TextStyle(fontSize: 16, height: 1.4),
//             // ),
//             TextButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(Colors.blue)),
//                 onPressed: () {
//                   FirebaseAuth.instance.signOut();
//                 },
//                 child: const Text(
//                   'SignOut',
//                   textAlign: TextAlign.center,
//                 )),
//           ],
//         ),
//       );
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileapplication/screens/edit_profile_page.dart';
import 'package:mobileapplication/widget/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        // appBar: AppBar(
        //   backgroundColor: Colors.grey[900],
        //   actions: [
        //     IconButton(
        //       onPressed: signUserOut,
        //       icon: const Icon(Icons.logout),
        //     )
        //   ],
        // ),
        // body: Center(
        //     child: Text(
        //   "LOGGED IN AS: " + user.email!,
        //   style: TextStyle(fontSize: 20),
        // )),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            // ProfileWidget(
            //   imagePath: user.photoURL!,
            //   onClicked: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => EditProfilePage()),
            //     );
            //   },
            // ),
            const SizedBox(height: 24),
            Text(
              "Welcome EgyMania User: ${user.email!}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const SizedBox(height: 48),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  Navigator.pushNamed(context, '/EditProfilePage');
                },
                child: const Text(
                  'Edit your profile',
                  textAlign: TextAlign.center,
                )),
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  signUserOut();
                },
                child: const Text(
                  'SignOut',
                  textAlign: TextAlign.center,
                )),
          ],
        ));
  }
}
//   Widget buildName() => Column(
//         children: [
//           Text(
//             "Welcome EgyMania User: ${user.email!}",
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 4),
//           // Text(
//           //   user.get('firstname'),
//           //   style: TextStyle(color: Colors.grey),
//           // )
//         ],
//       );

//   Widget buildAbout() => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text(
//             //   'About',
//             //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             // ),
//             // const SizedBox(height: 16),
//             // Text(
//             //   user.about,
//             //   style: TextStyle(fontSize: 16, height: 1.4),
//             // ),
//             TextButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(Colors.blue)),
//                 onPressed: () {
//                   signUserOut();
//                 },
//                 child: const Text(
//                   'Edit your profile',
//                   textAlign: TextAlign.center,
//                 )),
//             TextButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(Colors.blue)),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/EditProfilePage');
//                 },
//                 child: const Text(
//                   'SignOut',
//                   textAlign: TextAlign.center,
//                 )),
//           ],
//         ),
//       );
// }
