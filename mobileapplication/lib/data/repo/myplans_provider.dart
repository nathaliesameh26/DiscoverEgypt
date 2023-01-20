import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/pending_data.dart';

import '../dataApp/myplans_data.dart';

//---------------------PendingProvider------------------------//

Stream plansData = Plans().getMyPlans();
final plansDataProviderRepository = StateProvider<Stream>((ref) => plansData);
//gets the data from the model

final plansDataProvider = StreamProvider(
    //bagyb beh aldata,byt3amel my al-ui
    //ui byklem provider
    (ref) => ref.watch(plansDataProviderRepository));




    // //provider byklm almodel
// Future plansData = Plans().getMyPlans() as Future;
// final plansDataProviderRepository = StateProvider<Future>((ref) => plansData);
// //gets the data from the model

// final plansDataProvider = FutureProvider(
//   //bagyb beh aldata,byt3amel my al-ui
//   //ui byklem provider
//   (ref) async {
//     return ref.watch(plansDataProviderRepository);
//     //listens to the data
//   },
// );
