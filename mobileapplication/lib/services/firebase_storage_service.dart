import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:mobileapplication/controller/image_test/image_test_controller.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgname) async {
    if (imgname == null) {
      return null;
    }
    try {
      var urlRef =
          firebaseStorage.child("files").child('${imgname.toLowerCase()}.jpg');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
