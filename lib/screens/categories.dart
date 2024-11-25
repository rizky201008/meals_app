import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext ctx, Category category) {
    final meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: meals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick a Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20, // space between columns
          mainAxisSpacing: 20, // space between rows
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              onSelectCategory: () {
                _selectCategory(context, category);
              },
              category: category,
            )
        ],
      ),
    );
  }
}
