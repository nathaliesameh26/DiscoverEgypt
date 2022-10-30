import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileapplication/data/loginData.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = LoginUser.Luser;
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
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
                      Colors.white.withOpacity(0.5),
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
                                color: Color.fromARGB(255, 243, 240, 240)),
                          ),
                          const Text(
                            "EgyMania!",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 243, 240, 240)),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter your name",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'[a-z A-Z]+$').hasMatch(value!)) {
                                return "Enter name";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          TextFormField(
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
                                          backgroundColor: Color(0xFF363f93)),
                                      child: Text(
                                        "Sign Up ",
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      final snackBar = SnackBar(
                                          content: Text('Submitting form'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF363f93)),
                                  child: Text(
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
