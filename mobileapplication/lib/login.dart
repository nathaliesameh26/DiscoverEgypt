import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff5ac18e),
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Password',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff5ac18e),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildLoginBtn() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xff5ac18e),
                spreadRadius: 1,
                blurRadius: 0,
                offset: Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(-4, -4),
              )
            ]),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ));
}

Widget buildSignUpBtn() {
  return GestureDetector(
    //onTap: () {Navigator.of(context).pushNamed("/register")},
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Dont have an Account?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    buildEmail(),
                    SizedBox(
                      height: 50,
                    ),
                    buildPassword(),
                    SizedBox(
                      height: 20,
                    ),
                    buildSignUpBtn(),
                    buildLoginBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

//   Widget content() {
//     return Column(
//       children: [
//         Container(
//           height: 200,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: Color.fromARGB(255, 22, 46, 180),
//               borderRadius:
//                   BorderRadius.only(bottomRight: Radius.elliptical(80, 80))),
//           child: Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: Image.asset('assets/Egypt.jpg')),
//         ),
//         SizedBox(
//           height: 60,
//         ),
//         InputStyle("Username", "Enter your username "),
//         SizedBox(
//           height: 20,
//         ),
//         InputStyle("Password", "Enter your password "),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           height: 60,
//           width: 300,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 22, 46, 180),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: TextButton(
//             onPressed: () {},
//             child: Text(
//               "Login",
//               style: TextStyle(fontSize: 20, color: Colors.white),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         RichText(
//             text: TextSpan(children: [
//           TextSpan(
//             text: "Don't have an account?",
//             style: TextStyle(fontSize: 15, color: Colors.grey),
//           ),
//           TextSpan(
//               text: "Register",
//               style: TextStyle(
//                 fontSize: 15,
//                 color: Color.fromARGB(255, 22, 46, 180),
//               ),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   Navigator.of(context).pushNamed("/register");
//                 })
//         ]))
//       ],
//     );
//   }
// }

// Widget InputStyle(String title, String hintTxt) {
//   return Padding(
//       padding: const EdgeInsets.fromLTRB(40, 5, 20, 10),
//       child: Row(
//         children: [
//           Text(
//             "$title",
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//               child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 7,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(left: 10),
//                 hintText: hintTxt,
//               ),
//             ),
//           ))
//         ],
//       ));
// }
//}
