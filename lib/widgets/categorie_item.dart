import 'package:flutter/material.dart';

import '../screens/Categorie_Meals_Screen.dart';

class CategorieItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategorieItem(this.id, this.color, this.title);

  void categorieSelect(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => CategorieMeals(id, title)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => categorieSelect(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
