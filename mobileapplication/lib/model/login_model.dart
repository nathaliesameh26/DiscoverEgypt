import 'dart:convert';
import 'dart:core';

class UserLogin {
  String username;
 String password;

  UserLogin({required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': username,
      'password': password,
    };
  }

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
      username: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLogin.fromJson(String source) =>
      UserLogin.fromMap(json.decode(source) as Map<String, dynamic>);
}
