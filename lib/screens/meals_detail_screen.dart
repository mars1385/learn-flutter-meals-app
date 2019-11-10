//import
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  //route
  static const routeName = '/meal_detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealsDetailScreen(this.toggleFavorite, this.isFavorite);
  //our methode
  Widget titleBuilder(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget containerBuilder(Widget child) {
    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsId = ModalRoute.of(context).settings.arguments as String;
    final currentMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealsId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${currentMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                currentMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            titleBuilder(context, 'Ingredients'),
            Container(
              height: 200,
              width: 300,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(currentMeal.ingredients[index])),
                ),
                itemCount: currentMeal.ingredients.length,
              ),
            ),
            titleBuilder(context, 'Steps'),
            containerBuilder(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(
                      currentMeal.steps[index],
                    ),
                  ),
                  Divider()
                ],
              ),
              itemCount: currentMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealsId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealsId),
      ),
    );
  }
}
