// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mobileapplication/data/dataApp/place_data.dart';
// import 'package:mobileapplication/data/dataApp/place_data_test.dart';

// //---------------------PlacesProvider------------------------//

// // //provider byklm almodel
// // Future placesData1 = Test().getSpecificPlace();
// // final placesDataProviderRepository1 =
// //     StateProvider<Future>((ref) => placesData1);
// // //gets the data from the model

// // final placesDataProvider1 = FutureProvider(
// //   //bagyb beh aldata,byt3amel my al-ui
// //   //ui byklem provider
// //   (ref) {
// //     return ref.watch(placesDataProviderRepository1);
// //     //listens to the data
// //   },
// // );

// Stream placesData1 = Test().getSpecificPlace();
// final placesDataProviderRepository1 =
//     StateProvider<Stream>((ref) => placesData1);
// //gets the data from the model

// final placesDataProvider1 = StreamProvider(
//     //bagyb beh aldata,byt3amel my al-ui
//     //ui byklem provider
//     (ref) => ref.watch(placesDataProviderRepository1));
