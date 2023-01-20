import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileapplication/data/dataApp/login_data.dart';

//--------------- adding each plan with the user id ----------------//

class Plans {
  Future addMyPlans(
      String userId, String name, String location, String price) async {
    await FirebaseFirestore.instance.collection('plans').add({
      'userId': userId,
      'name': name,
      'location': location,
      'price': price,
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
