import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/user.dart';
import '../../model/pending_model.dart';

//---------------------PendingProvider------------------------//

//provider byklm almodel
Future pendingData = PendingData().PendingDetails();
final pendingDataProviderRepository =
    StateProvider<Future>((ref) => pendingData);
//gets the data from the model

final pendingDataProvider = FutureProvider(
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) async {
    return ref.watch(pendingDataProviderRepository);
    //listens to the data
  },
);
