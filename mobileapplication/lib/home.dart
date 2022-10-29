import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Image(
            image: AssetImage('assets/Egypt.jpg'),
            alignment: Alignment.center,
            height: 705,
            width: 700,
            fit: BoxFit.fill,
          ),
          // Padding(padding: EdgeInsets.fromLTRB(0, 170, 0, 0)),
          // Text('EgyMania', style: TextStyle(fontSize: 20, color: Colors.black)),
          // ignore: prefer_const_constructors
          Positioned.fill(
              // ignore: prefer_const_constructors
              child: Align(
            alignment: Alignment.center,
            child: Text(
              "Explore New places with us!",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ))
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.fromLTRB(20, 170, 0, 0),
          //       child: Text(
          //         "Explore new  places with us!",
          //         maxLines: 2,
          //         style: TextStyle(fontSize: 32),
          //       ),
          //       decoration: BoxDecoration(color: Colors.yellow),
          //     ),
          // Container(
          //   child: Text(
          //     "text 2",
          //     style: TextStyle(fontSize: 32),
          //   ),
          //   decoration: BoxDecoration(color: Colors.green),
          // ),
        ],
      ),
      //],
    );
    //  ),
    // );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('My Project')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: Text('Item1'),
//               onTap: () {},
//             ),
//             ListTile(
//               title: Text('Item2'),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           Column(
//             children: [
//               Image.asset('assets/Egypt.jpg', width: 500),
//               Text('Nathalie'),
//               const TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter the username',
//                 ),
//               ),
//               SizedBox(height: 30),
//               const TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter the Password',
//                 ),
//               ),
//               ButtonBar(
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Next'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Cancel'),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

