import 'package:flutter/material.dart';

import '../widgets/categorie_item.dart';
import '../screens/favorites.dart';

import '../dummy_Data.dart';

class CategorieScreen extends StatelessWidget {
  static const Routename = '/CategorieScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          FlatButton(
            child: Icon(Icons.favorite),
            onPressed: () =>
                Navigator.of(context).pushNamed(FavoriteScreen.routename),
          ),
          Padding(padding: EdgeInsets.only(right: 10))
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((ctx) => CategorieItem(ctx.id, ctx.color, ctx.title))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.6,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
          mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
        ),
      ),
    );
  }
}
