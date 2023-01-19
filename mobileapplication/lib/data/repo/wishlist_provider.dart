import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/wishlist_data.dart';

//---------------------WishlistProvider------------------------//

//provider byklm almodel
Future wishlistData = WishList().getWishListData();
final wishlistDataProviderRepository =
    StateProvider<Future>((ref) => wishlistData);
//gets the data from the model

final wishlistDataProvider = FutureProvider(
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) async {
    return ref.watch(wishlistDataProviderRepository);
    //listens to the data
  },
);





// import 'dart:core';
// import 'package:flutter/material.dart';

// class FavoriteProvider extends ChangeNotifier {
//   List<String> _places = [];
//   List<String> get places => _places;

//   void toggleFavorite(String places) {
//     final isExist = _places.contains(places);
//     if (isExist) {
//       _places.remove(places);
//     } else {
//       _places.add(places);
//     }
//     notifyListeners();
//   }

//   void clearFavorite() {
//     _places = [];
//     notifyListeners();
//   }
// }
