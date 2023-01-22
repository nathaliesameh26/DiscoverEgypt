import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/pending_data.dart';

//---------------------PendingProvider------------------------//
//provider byklm almodel
Stream pendingData = PendingData().pendingDetails();
final pendingDataProviderRepository = StateProvider<Stream>((ref) => pendingData);
//gets the data from the model

final pendingDataProvider = StreamProvider((
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) => ref.watch(pendingDataProviderRepository))
    //listens to the data
);
