import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setMultipleFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

// final meals = ref.watch(mealsProvider);
// final selectedFilters = ref.watch(filtersProvider);
// final filteredMeals = meals.where((meal) {
//   if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
//     return false;
//   }
//   if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
//     return false;
//   }
//   if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
//     return false;
//   }
//   if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
//     return false;
//   }
//   return true;
// }).toList();
