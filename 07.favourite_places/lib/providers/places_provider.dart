import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:favourite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, name TEXT, image TEXT)');
    },
    version: 1,
  );
  return db;
}

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  Future<void> loadPlacesFromDb() async {
    final db = await _getDatabase();
    final listOfPlaces = await db.query('user_places');
    final places = listOfPlaces
        .map(
          (row) => Place(
            id: row['id'] as String,
            name: row['name'] as String,
            image: File(row['image'] as String),
          ),
        )
        .toList();
    state = places;
  }

  void updatePlaces(String place, File image) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace = Place(name: place, image: copiedImage);

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': newPlace.id,
      'name': newPlace.name,
      'image': newPlace.image.path
    });

    state = [
      ...state,
      newPlace,
    ];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
