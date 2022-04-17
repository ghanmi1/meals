import 'package:flutter/material.dart';

import '../widgets/meal_details.dart';
import '../dummy_Data.dart';

class MealsDetailsScreen extends StatelessWidget {
  final String itemId;
  final String itemTitle;

  MealsDetailsScreen(this.itemId, this.itemTitle);

  @override
  Widget build(BuildContext context) {
    final detailsOfMeals = DUMMY_MEALS.where((meal) {
      return meal.id == itemId;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealDetails(
            id: detailsOfMeals[index].id,
            title: detailsOfMeals[index].title,
            affordability: detailsOfMeals[index].affordability,
            complexity: detailsOfMeals[index].complexity,
            imageUrl: detailsOfMeals[index].imageUrl,
            duration: detailsOfMeals[index].duration,
            ingredients: detailsOfMeals[index].ingredients,
          );
        }),
        itemCount: detailsOfMeals.length,
      ),
    );
  }
}
