import 'package:flutter/material.dart';

import '../models/meals.dart';

class MealDetails extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;

  MealDetails(
      {this.affordability,
      this.ingredients,
      this.steps,
      this.id,
      this.complexity,
      this.duration,
      this.imageUrl,
      this.title});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Chalenging';
        break;

      case Complexity.Hard:
        return 'hard';
        break;
      default:
        return 'unknown ';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'unknown ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black54,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 6,
                          ),
                          Text('$duration min')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(
                            width: 6,
                          ),
                          Text(complexityText)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money),
                          SizedBox(
                            width: 6,
                          ),
                          Text(affordabilityText)
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 200,
          width: 100,
          child: ListView.builder(
            itemBuilder: (ctx, index) => Card(
              child: Text(ingredients[index]),
            ),
            itemCount: ingredients.length,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(),
      ],
    );
  }
}
