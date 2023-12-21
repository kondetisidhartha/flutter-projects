import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.filteredMeals});

  final List<Meal> filteredMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // vsync in nutshell, provides animation of 60 times per sec for this component
    // to do that it must read the component properties so Mixin used at top and passed this.
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0, // default
      upperBound: 1, // default
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final availableMeals = widget.filteredMeals.where(
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
    return AnimatedBuilder(
      animation: _animationController,
      // child tells not to animate this part like 60 times per sec
      // but only in builder.
      child: GridView(
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
      ),
      builder: (context, child) {
        // return Padding(
        //   padding: EdgeInsets.only(
        //     top: 100 - _animationController.value * 100,
        //   ),
        //   child: child,
        // );
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
