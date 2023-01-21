import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/events_data.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream evensData = EventsData().EventDetails();
final eventsDataProviderRepository = StateProvider<Stream>((ref) => evensData);
//gets the data from the model

final eventsDataProvider = StreamProvider((
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) => ref.watch(eventsDataProviderRepository))
    //listens to the data
);