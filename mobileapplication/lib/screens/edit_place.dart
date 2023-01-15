// import 'package:flutter/material.dart';

// class EditProductPage extends StatefulWidget {
//   @override
//   _EditProductPageState createState() => _EditProductPageState();
// }

// class _EditProductPageState extends State<EditProductPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name;
//   String _description;
//   String _price;
//   String _location;
//   String _city;
//   String _openingTime;
//   String _closingTime;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Product"),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _name = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Description'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _description = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Price'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a price';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _price = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Location'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a location';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _location = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'City'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a city';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _city = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Opening Time'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter an opening time';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _openingTime = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Closing Time'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a closing time';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _closingTime = value,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState!.save();
//                       // Perform the update operation here
//                       // e.g. updating a Firebase or SQLite database
//                       Scaffold.of(context).showSnackBar(
//                         SnackBar(content: Text('Updating Product...')),
//                       );
//                     }
//                   },
//                   child: Text('Update Product'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
