import 'package:favourite_places/providers/places_provider.dart';
import 'package:favourite_places/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredPlace = "";

  void savePlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(placesProvider.notifier).updatePlaces(_enteredPlace);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Add place"),
                ),
                style: titleMediumOnBackground(context),
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Cannot be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredPlace = value!;
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
