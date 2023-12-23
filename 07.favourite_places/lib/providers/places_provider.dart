import 'package:favourite_places/models/place.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const uuid = Uuid();

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]);

  void updatePlaces(String place) {
    state = [
      ...state,
      Place(id: uuid.v4(), name: place),
    ];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
