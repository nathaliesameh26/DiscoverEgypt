import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/dataApp/place_data.dart';

//provider byklm almodel
Stream placesData = PlacesData().placeDetails();
final placessDataProviderRepository = StateProvider<Stream>((ref) => placesData);
//gets the data from the model

final placesDataProvider = StreamProvider((
  //bagyb beh aldata,byt3amel my al-ui
  //ui byklem provider
  (ref) => ref.watch(placessDataProviderRepository))
    //listens to the data
);

