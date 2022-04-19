import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/mealItem.dart';

class FavoriteScreen extends StatelessWidget {
  static const routename = '/favoriteScreen';
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
          'Favorites',
          style: Theme.of(context).textTheme.headline6,
        )),
        body: Center(
          child: Text('No Favorites Added yet , try to add some '),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            title: Text(
          'Favorites',
          style: Theme.of(context).textTheme.headline6,
        )),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
            );
          }),
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
