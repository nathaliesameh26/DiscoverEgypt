import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/events_data.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Future evensData = EventsData().EventDetails();
final eventsDataProviderRepository = StateProvider<Future>((ref) => evensData);
//gets the data from the model

final eventsDataProvider = FutureProvider(
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) async {
    return ref.watch(eventsDataProviderRepository);
    //listens to the data
  },
);
