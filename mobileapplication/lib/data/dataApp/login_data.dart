import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobileapplication/model/login_model.dart';
import 'package:provider/provider.dart';

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

// class LoginUser {
//   static const Luser = UserLogin(
//     username: 'student',
//     password: '123',
//   );
// }

// class getUserDetails {
//   // ignore: non_constant_identifier_names
//   Future getUserDetailss() async {
//     final QuerySnapshot userDetails =

//         await FirebaseFirestore.instance.collection('users').get();
//     return userDetails;
//   }
// }

// class UserData {
//   Future<Object> getUserDetails() async {
//     final user = FirebaseAuth.instance.currentUser!;
//     String userIds = user.uid;
//     final QuerySnapshot userDetails =
//         await FirebaseFirestore.instance.collection('users').get();
//     return userDetails;
//   }
// }

// class UserData {
Future Loginn(String email, String password) async {
  final User? user = (await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password))
      .user;

  userId = user!.uid;
}

Future signup(String email, String password) async {
  final User? newuser = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password))
      .user;
  CreateUser(newuser!.uid, 'firstname', 'lastname', email, 'DateOfBirth',
      password, 'phoneNum', 'nationality', 'role');
}
//for authentication

Future CreateUser(
    String idd,
    String fname,
    String lname,
    String email,
    String DOB,
    String password,
    String phone,
    String nationality,
    String role) async {
  await FirebaseFirestore.instance.collection('users').doc(idd).set({
    'id': idd,
    'firstname': fname,
    'lastname': lname,
    'email': email,
    'DateOfBirth': DOB,
    'password': password,
    'phoneNum': phone,
    'nationality': nationality,
    'role': role,
  });
}
//}



// final user = FirebaseAuth.instance.currentUser!;
// String userID = user.uid;

// class User {
//   Future<Object> UserDetails() async {
//     final user = FirebaseAuth.instance.currentUser!;
//     String userIDs = user.uid;
//     final DocumentSnapshot documentSnapshot =
//         await FirebaseFirestore.instance.collection('users').doc(userIDs).get();
//     return documentSnapshot;
//   }
// }

// Future LoginIn(String email, String password) async {
//   final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: email.trim(),
//     password: password.trim(),
//   ))
//       .user;

//   userID = user!.uid;
// }

// Future SignIn(String email, String password){
//    final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: email.trim(),
//     password: password.trim(),
//   ))
//       .user;

//       addUser(newUser!.uid,'username',email.trim(),password.trim(),
//       'phoneNumber','Image');
// }

// Future addUser(String userID, String username, String email, String password, String PhoneNo, String Image) async{
//   await FirebaseFirestore.instance.collection('users').doc(userID).set({
//     'id': userID,
//     'Name': username,
//     'Email': email,
//     'password':password,
//     'PhoneNo':int.parse(PhoneNo),
//     'Image':Image,

//   });
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString('UserID', userID);

// }



