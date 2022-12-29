import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileapplication/model/login_model.dart';

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
