import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobileapplication/model/login_model.dart';

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class LoginUser {
  static const Luser = UserLogin(
    username: 'student',
    password: '123',
  );
}

Future Loginn(String email, String password) async {
  final User? user = (await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password))
      .user;
}

Future signup(String email, String password) async {
  final User? user = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password))
      .user;
}

Future CreateUser(String idd , String fname, String lname, String email, String password,
    String phone, String nationality,String role) async {
  await FirebaseFirestore.instance.collection('users').add({ 
    'id':idd,
    'firstname' :fname,
    'lastname':lname,
    'email':email,
    'phoneNum':phone,
    'password':password,
    'nationality':nationality,
    'role':role,
  });
}

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



