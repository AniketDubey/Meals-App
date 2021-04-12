import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget _buildText(BuildContext context, String title) {
      return Container(
        //margin: EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget _buildContainer(List<String> listofstring) {
      return Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Text(listofstring[index]),
              ),
            );
          },
          itemCount: listofstring.length,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildText(
              context,
              "Ingredients",
            ),
            _buildContainer(
              selectMeal.ingredients,
            ),
            _buildText(
              context,
              "Steps",
            ),
            _buildContainer(
              selectMeal.steps,
            ),
          ],
        ),
      ),
    );
  }
}
