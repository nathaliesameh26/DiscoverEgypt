import 'dart:core';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _places = [];
  List<String> get places => _places;

  void toggleFavorite(String places) {
    final isExist = _places.contains(places);
    if (isExist) {
      _places.remove(places);
    } else {
      _places.add(places);
    }
    notifyListeners();
  }

  void clearFavorite() {
    _places = [];
    notifyListeners();
  }
}
