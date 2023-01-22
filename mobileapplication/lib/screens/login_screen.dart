// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobileapplication/data/dataApp/login_data.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   //final user = LoginUser.Luser;
//   final formKey = GlobalKey<FormState>(); //key for form
//   String name = "";
//   //final userData = UserData();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//     return Scaffold(
//       key: _scaffoldKey,
//       // appBar: AppBar(
//       //   backgroundColor: Colors.transparent,
//       //   elevation: 0,
//       // ),
//       backgroundColor: const Color(0xFFffffff),
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 // ignore: prefer_const_constructors
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
//                     image: const AssetImage('assets/temple.jpg'),
//                     colorFilter: ColorFilter.mode(
//                       Colors.white.withOpacity(1),
//                       BlendMode.modulate,
//                     ),
//                     fit: BoxFit.cover,
//                     // gradient: LinearGradient(
//                     //   begin: Alignment.topCenter,
//                     //   end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 100),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 40, right: 40),
//                     child: Form(
//                       key: formKey, //key for form
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: height * 0.03),
//                             const Text(
//                               "Welcome To",
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   color: Color.fromARGB(255, 255, 255, 255)),
//                             ),
//                             const Text(
//                               "EgyMania!",
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   color: Color.fromARGB(255, 255, 255, 255)),
//                             ),
//                             SizedBox(
//                               height: height * 0.05,
//                             ),
//                             TextFormField(
//                               controller: emailController,
//                               style: const TextStyle(color: Colors.white),
//                               decoration: const InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 1,
//                                       color: Colors.white), //<-- SEE HERE
//                                 ),
//                                 hintText: "Enter your email",
//                                 hintStyle: TextStyle(color: Colors.white),
//                               ),
//                               validator: (value) {
//                                 if (value!.isEmpty ||
//                                     !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
//                                   return "Enter your email correctly";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                             SizedBox(
//                               height: height * 0.05,
//                             ),
//                             TextFormField(
//                               controller: passwordController,
//                               style: const TextStyle(color: Colors.white),
//                               decoration: const InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 hintText: "Enter your password",
//                                 hintStyle: TextStyle(color: Colors.white),
//                               ),
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Enter password";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                             SizedBox(
//                               height: height * 0.05,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Expanded(
//                                     child: ElevatedButton(
//                                         // "Sign Up",
//                                         // style: TextStyle(fontSize: 22, color: Color(0xFF363f93)),
//                                         onPressed: () {
//                                           Navigator.pushNamed(
//                                               context, '/register');
//                                         },
//                                         style: TextButton.styleFrom(
//                                             // ignore: prefer_const_constructors
//                                             backgroundColor: Color.fromARGB(
//                                                 255, 255, 115, 0)),
//                                         child: const Text(
//                                           "Sign Up ",
//                                           style: TextStyle(color: Colors.white),
//                                         ))),
//                                 Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: ElevatedButton(
//                                     onPressed: () async {
//                                       try {
//                                         await Loginn(emailController.text,
//                                             passwordController.text);
//                                         Navigator.pushNamed(context, '/');
//                                       } on FirebaseAuthException catch (e) {
//                                         if (e.code == 'user-not-found') {
//                                           print(
//                                               'No user found for that email.');
//                                         } else if (e.code == 'wrong-password') {
//                                           print(
//                                               'Wrong password provided for that user.');
//                                         }
//                                       }
//                                     },
//                                     style: TextButton.styleFrom(
//                                         backgroundColor: const Color.fromARGB(
//                                             255, 255, 115, 0)),
//                                     child: const Text(
//                                       "Login ",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileapplication/data/dataApp/login_data.dart';
import 'package:mobileapplication/model/my_button.dart';
import 'package:mobileapplication/model/my_textfield.dart';
import 'package:mobileapplication/model/square_tile.dart';
import 'package:mobileapplication/screens/register_screen.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                Text(
                  'You should to SignIN!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // const SizedBox(height: 10),

                // // forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Forgot Password?',
                //         style: TextStyle(color: Colors.grey[600]),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 25),

                // sign in button
                // MyButton(
                // onTap: Loginn(emailController.text, passwordController.text),
                ElevatedButton(
                  child: null,
                  onPressed: () async {
                    try {
                      await Loginn(
                          emailController.text, passwordController.text);
                      Navigator.pushNamed(context, '/');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Register now'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
