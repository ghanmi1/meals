import 'package:first_app/screens/favorites.dart';
import 'package:flutter/material.dart';

import './screens/Splash_Screen.dart';
import './screens/Categorie_Meals_Screen.dart';
import './screens/Categorie_screen.dart';
import './screens/Meals_DetailsScreen.dart';
import './models/meals.dart';
import 'dummy_Data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existantIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existantIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existantIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromARGB(255, 234, 222, 166),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  // body: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
                  // bodyText2: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      routes: {
        '/': ((context) => SplashScreen()),
        CategorieScreen.Routename: (ctx) => CategorieScreen(),
        CategorieMeals.routeName: (context) => CategorieMeals(),
        MealsDetailsScreen.routename: (context) =>
            MealsDetailsScreen(_toggleFavorite, _isMealFavorite),
        FavoriteScreen.routename: (context) => FavoriteScreen(_favoriteMeals),
      },
    );
  }
}
