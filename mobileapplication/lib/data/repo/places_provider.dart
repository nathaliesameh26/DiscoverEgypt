import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/place_model.dart';

//---------------------PlacesProvider------------------------//

//provider byklm almodel
Future placesData = PlacesData().PlaceDetails();
final placesDataProviderRepository = StateProvider<Future>((ref) => placesData);
//gets the data from the model

final placesDataProvider = FutureProvider(
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) {
    return ref.watch(placesDataProviderRepository);
    //listens to the data
  },
);

// DeletePlace(){

// }