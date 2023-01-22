import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/place_data.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream evensData = PlacesData().placesDetails();
final placesDataProviderRepository = StateProvider<Stream>((ref) => evensData);
//gets the data from the model

final placesDataProvider = StreamProvider((
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) => ref.watch(placesDataProviderRepository))
    //listens to the data
);