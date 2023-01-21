import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileapplication/data/dataApp/login_data.dart';

//--------------- adding each plan with the user id ----------------//

class Plans {
  Future addMyPlans(
    String location,
    String name,
    String phone,
    String userId,
    String placeId,
  ) async {
    await FirebaseFirestore.instance.collection('plans').add({
      'location': location,
      'name': name,
      'phone': phone,
      'userId': userId,
      'placeId': placeId,
    });
  }

//-----------------getting the plans of s specific user -----------------//

  Stream<QuerySnapshot> getMyPlans() {
    return FirebaseFirestore.instance
        .collection('plans')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }
}
