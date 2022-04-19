import 'package:flutter/material.dart';

import '../widgets/meal_details.dart';
import '../dummy_Data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routename = '/MealsScreen';

  final Function isFavorite;
  final Function toggleFavorite;
  MealsDetailsScreen(this.toggleFavorite, this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final itemId = routeArgs['id'];
    final itemTitle = routeArgs['title'];

    final detailsOfMeals = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == itemId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
      ),
      body: SingleChildScrollView(
        child: MealDetails(
          toggleFavorite: toggleFavorite,
          isMealFavorite: isFavorite,
          id: detailsOfMeals.id,
          title: detailsOfMeals.title,
          ingredients: detailsOfMeals.ingredients,
          steps: detailsOfMeals.steps,
          imageUrl: detailsOfMeals.imageUrl,
        ),
      ),
    );
  }
}
