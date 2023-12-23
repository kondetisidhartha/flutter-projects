import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Center(
        child: Text(
          place.name,
          style: bodyMediumOnBackground(context),
        ),
      ),
    );
  }
}
