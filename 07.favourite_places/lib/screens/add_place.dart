import 'package:favourite_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerWidget {
  const AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    String enteredPlace = "";

    void savePlace() {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        ref.read(placesProvider.notifier).updatePlaces(enteredPlace);
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Add place"),
                ),
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Cannot be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredPlace = value!;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: savePlace,
                icon: const Icon(
                  Icons.add,
                  size: 16,
                ),
                label: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
