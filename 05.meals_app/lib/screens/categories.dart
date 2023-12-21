import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.filteredMeals});

  final List<Meal> filteredMeals;

  void _selectCategory(BuildContext context, Category category) {
    final availableMeals = filteredMeals.where(
      (meal) => meal.categories.contains(category.id),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: availableMeals.toList()),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: availableCategories
          .map((category) => CategoryGridItem(
                category: category,
                onTapCategory: () => _selectCategory(context, category),
              ))
          .toList(),
    );
  }
}
