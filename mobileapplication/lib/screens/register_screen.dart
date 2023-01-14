import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobileapplication/model/loginData.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationality = TextEditingController();
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
                //ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: const AssetImage('assets/temple.jpg'),
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(1),
                      BlendMode.modulate,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.symmetric(
                      // horizontal: 25,
                      // vertical: 120,
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
                              "Sign Up To",
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
                              height: height * 0.03,
                            ),
                            TextFormField(
                              controller: fname,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Enter your first name",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
                                  return "first name must contain characters";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TextFormField(
                              controller: lname,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Enter your last name",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
                                  return "first name must contain characters";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TextFormField(
                              controller: email,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return "Enter the email correctly";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TextFormField(
                              controller: phone,
                              // onChanged:(value){
                              //   phone = value;
                              // },
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Enter your phone number",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter the phone number";
                                } else if (value.length != 11) {
                                  return "The phone number isn't correct";
                                } else if (!RegExp(r"^[1-10]+")
                                    .hasMatch(value)) {
                                  return "The phone number don't have to include characters or /%^";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TextFormField(
                              controller: password,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Enter your password",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter the password ";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            TextFormField(
                              controller: nationality,
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Enter your Nationality",
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
                                  return "Enter the email correctly";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // Expanded(
                                //     child: ElevatedButton(
                                //   // "Sign Up",
                                //   // style: TextStyle(fontSize: 22, color: Color(0xFF363f93)),
                                //   onPressed: () {
                                //     // if (formKey.currentState!.validate()) {
                                //     //   const snackBar = SnackBar(
                                //     //       content: Text('Submitting form'));
                                //     //   ScaffoldMessenger.of(context)
                                //     //       .showSnackBar(snackBar);
                                //     // }
                                //     // Navigator.pushNamed(context, '/register');
                                //   },
                                //   child: null,
                                //   // style: TextButton.styleFrom(
                                //   //     backgroundColor: Color(0xFF363f93)),
                                //   // child: const Text(
                                //   //  "Sign Up ",
                                //   //   style: TextStyle(color: Colors.white),
                                //   // )
                                // )),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await signup(email.text, password.text);
                                      CreateUser(
                                          userId,
                                          fname.text,
                                          lname.text,
                                          email.text,
                                          password.text,
                                          phone.text,
                                          nationality.text,
                                          'user');
                                      //controller lazm yet7ol text
                                      if (formKey.currentState!.validate()) {
                                        const snackBar = SnackBar(
                                            content: Text('Submitting form'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 115, 0)),
                                    child: const Text(
                                      "Sign Up ",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
