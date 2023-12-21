import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

// static data, that doesnt change - for dynamic use StateNotifierProvider
final mealsProvider = Provider((ref) => dummyMeals);
