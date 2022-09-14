import 'package:Meal_App/module/meal.dart';
import 'package:Meal_App/widget/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meal';
  final List<Meal> availablemeal;
  CategoryMealsScreen(this.availablemeal);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeal;
  @override
  void didChangeDependencies() {
    final routArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    displayMeal = widget.availablemeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id : displayMeal[index].id,
            imgeurl: displayMeal[index].imageUrl,
            title: displayMeal[index].title,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            affordability: displayMeal[index].affordability,

          );
        },
        itemCount: displayMeal.length, //عدد العناصر
      ),
    );
  }
}
