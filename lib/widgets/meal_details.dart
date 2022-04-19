import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetails({
    this.toggleFavorite,
    this.isMealFavorite,
    this.ingredients,
    this.steps,
    this.id,
    this.imageUrl,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final mediaqueryP =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          margin: EdgeInsets.all(8),
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                height: mediaqueryP * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 5,
                right: 5,
                child: FlatButton(
                  child: Icon(
                    isMealFavorite(id) ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () => toggleFavorite(id),
                ))
          ]),
        ),
        SizedBox(
          height: mediaqueryP * 0.01,
        ),
        Container(
          child: Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: mediaqueryP * 0.01,
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          height: mediaqueryP * 0.28,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (ctx, index) => Card(
              elevation: 0,
              color: Theme.of(context).canvasColor,
              child: Text(
                '-${ingredients[index]}',
                textAlign: TextAlign.left,
              ),
            ),
            itemCount: ingredients.length,
          ),
        ),
        SizedBox(
          height: mediaqueryP * 0.01,
        ),
        Container(
          child: Text(
            'Steps',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: mediaqueryP * 0.01,
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          height: mediaqueryP * 0.28,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: ((context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          child: FittedBox(child: Text('Step:${(index + 1)}'))),
                      title: Text(steps[index]),
                    )
                  ],
                )),
            itemCount: steps.length,
          ),
        ),
      ],
    );
  }
}
