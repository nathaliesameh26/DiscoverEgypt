import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileapplication/model/loginData.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = LoginUser.Luser;
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: Color(0xFFffffff),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: AssetImage('assets/temple.jpg'),
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(1),
                      BlendMode.modulate,
                    ),
                    fit: BoxFit.fitHeight,
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Form(
                      key: formKey, //key for form
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.03),
                          const Text(
                            "Welcome To",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          const Text(
                            "EgyMania!",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Enter your name",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
                                return "Enter your name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          TextFormField(
                            controller: passwordController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter password";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ElevatedButton(
                                      // "Sign Up",
                                      // style: TextStyle(fontSize: 22, color: Color(0xFF363f93)),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/register');
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 255, 115, 0)),
                                      child: const Text(
                                        "Sign Up ",
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await Loginn(emailController.text,
                                          passwordController.text);
                                      Navigator.pushNamed(
                                          context, '/homescreen');
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        print('No user found for that email.');
                                      } else if (e.code == 'wrong-password') {
                                        print(
                                            'Wrong password provided for that user.');
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 115, 0)),
                                  child: const Text(
                                    "Login ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
