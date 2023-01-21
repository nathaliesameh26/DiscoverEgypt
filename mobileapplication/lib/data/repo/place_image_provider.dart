import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileapplication/data/repo/places_image.dart';

Stream moodTrackerData = TopSights().getTopSights('name');
final moodTrackerProviderRepository =
    StateProvider<Stream>((ref) => moodTrackerData);

final moodTrackerProvider =
    StreamProvider(((ref) => ref.watch(moodTrackerProviderRepository)));
