// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import '../data/repo/user_provider.dart';
// import 'package:riverpod/riverpod.dart';

// class UsernameShow extends StatelessWidget {
//   const UsernameShow({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (_, ref, __) {
//       return ref.watch(userDataProvider).when(data: (value) {
//         return Center(
//           child: Text(
//             'Welcome, ${value.get('name')}',
//             style: const TextStyle(
//               backgroundColor: Colors.blue,
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         );
//       }, error: (Object error, StackTrace err) {
//         return const Text('Error loading the name');
//       }, loading: () {
//         return const CircularProgressIndicator();
//       });
//     });
//   }
// }
