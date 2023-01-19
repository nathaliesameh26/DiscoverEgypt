import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../model/loginData.dart';
import '../dataApp/user_data.dart';

//---------------------UserProvider------------------------//

//provider byklm almodel
Future userData = UserData().getUserDetails();
final userDataProviderRepository = StateProvider<Future>((ref) => userData);
//gets the data from the model

final userDataProvider = FutureProvider(
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) async {
    return ref.watch(userDataProviderRepository);
    //listens to the data
  },
);
