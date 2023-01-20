//import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mobileapplication/services/firebase_storage_service.dart';

class imagetestcontroller extends GetxController {
  final allImages = <String>[].obs;

  Future<void> getAllImages() async {
    List<String> imgname = [
      "pexels-pixabay-220453",
      "84678891_2394532743981956_4629501628670541824_n",
      "alex.jpg"
    ];
    try {
      for (var img in imgname) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allImages.add(imgUrl!);
      }
    } catch (e) {}
  }
}
