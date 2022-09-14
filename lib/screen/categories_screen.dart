import 'package:Meal_App/dummy_date.dart';
import 'package:Meal_App/widget/category_item.dart';
import 'package:flutter/material.dart';
import '../dummy_date.dart';

class CategoriesScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body : GridView(
          padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catDate) =>
       CategoryItem(catDate.id, catDate.title, catDate.color),
        ).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
