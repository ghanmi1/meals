import 'package:flutter/material.dart';

import '../dummy_Data.dart';
import '../widgets/mealItem.dart';

class CategorieMeals extends StatelessWidget {
  final String categoryid;
  final String categorytitle;

  CategorieMeals(this.categoryid, this.categorytitle);

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
          );
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
