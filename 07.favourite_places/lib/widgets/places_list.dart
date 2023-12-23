import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/providers/places_provider.dart';
import 'package:favourite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addedPlaces = ref.watch(placesProvider);

    void showPlaceDetails(Place place) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => PlaceDetailScreen(
            place: place,
          ),
        ),
      );
    }

    return addedPlaces.isEmpty
        ? const Center(
            child: Text('No places to show.'),
          )
        : ListView.builder(
            itemCount: addedPlaces.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: () => showPlaceDetails(addedPlaces[index]),
                title: Text(addedPlaces[index].name),
              );
            },
          );
  }
}
