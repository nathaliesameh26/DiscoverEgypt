import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey, //key for form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              Text(
                "Welcome To",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              Text(
                "EgyMania!",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your name",
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
                  labelText: "Enter your password",
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
                            Navigator.pushNamed(context, '/register');
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
                          final snackBar =
                              SnackBar(content: Text('Submitting form'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
    );
  }
}
