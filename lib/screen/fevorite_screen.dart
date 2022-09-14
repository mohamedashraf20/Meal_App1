import 'package:Meal_App/module/meal.dart';
import 'package:Meal_App/widget/meal_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritemeal;

  FavoriteScreen(this.favoritemeal);

  @override
  Widget build(BuildContext context) {
    if (favoritemeal.isEmpty) {
      return Center(
        child: Text("you have no favorites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritemeal[index].id,
            imgeurl: favoritemeal[index].imageUrl,
            title: favoritemeal[index].title,
            duration: favoritemeal[index].duration,
            complexity: favoritemeal[index].complexity,
            affordability: favoritemeal[index].affordability,
          );
        },
        itemCount: favoritemeal.length, //عدد العناصر
      );
    }
  }
}
