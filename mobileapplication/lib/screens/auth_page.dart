import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileapplication/screens/Planner_panel.dart';
import 'package:mobileapplication/screens/adminpanel.dart';
import 'package:mobileapplication/screens/homeScreen.dart';
import 'package:mobileapplication/screens/login_screen.dart';
import 'package:mobileapplication/screens/profile_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;
    Widget homePageManager = ProfilePage();
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              firestoreInstance
                  .collection('users')
                  .doc(snapshot.data?.uid)
                  .get()
                  .then((DocumentSnapshot docs) {
                final data = docs.data() as Map<String, dynamic>;
                final role = data['role'];
                print(role);
                if (role == 'admin') {
                  return homePageManager = const AdminPanel();
                  print('into admin');
                } else if (role == 'planner') {
                  return homePageManager = PlannerPanel();
                } else if (role == 'user') {
                  return homePageManager = ProfilePage();
                }
              });
              print('target');
              return homePageManager;
            }

            // user is NOT logged in
            else {
              return Login();
            }
          }),
    );
  }
}

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<User?>(
//           future: FirebaseAuth.instance.currentUser,
//           builder: (context, snapshot) {
//             if (snapshot.hasData && snapshot.data != null) {
//               if (snapshot.data == 'user') {
//                 return ProfilePage();
//               } else if (snapshot.data == 'admin') {
//                 return const AdminPanel();
//               } else if (snapshot.data == 'planner') {
//                 return const PlannerPanel();
//               }
//             } else if (snapshot.hasError) {
//               return Text(snapshot.error.toString());
//             } else {
//               return Login();
//             }
//           }),
//     );
  
//   }
//   Future<String?> _getUserRole() async {
//     final _firestoreInstance = FirebaseFirestore.instance;
//     final currentUser = await FirebaseAuth.instance.currentUser;
//     if (currentUser == null) {
//       return null;
//     }

//     final doc = await _firestoreInstance
//         .collection('Users')
//         .doc(currentUser.uid)
//         .get();

//     if (!doc.exists) {
//       return null;
//     }

//     final role = doc.data()!['role'] as String;
//     return role;
//   }
// }
