import 'package:favourite_places/screens/add_place.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const AddPlaceScreen();
              }));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const PlacesList(),
    );
  }
}
