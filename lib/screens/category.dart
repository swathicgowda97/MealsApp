import 'package:flutter/material.dart';
import 'package:meals_app/data/categories.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      { required this.availableMeals,
      required this.onToggleFavorite,
      super.key});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredList =
        //dummyMeals
    availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    print(filteredList.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealsScreen(
            title: category.title,
            meals: filteredList,
            onToggleFavorite: onToggleFavorite,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        /// ...availableCategories.map((category) => CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectedCategory(context, category);
              }),
      ],
    );
  }
}
