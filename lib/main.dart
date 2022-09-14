import 'package:Meal_App/dummy_date.dart';
import 'package:Meal_App/screen/Meal_details_screen.dart';
import 'package:Meal_App/screen/categories_screen.dart';
import 'package:Meal_App/screen/category_mrals_screen.dart';
import 'package:Meal_App/screen/filters_screen.dart';
import 'package:Meal_App/screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'module/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availablemeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> _filterDate) {
    setState(() {
      _filters = _filterDate;
      _availablemeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['Vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['Vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingindex = _favoriteMeal.indexWhere((meal) =>
    meal.id == mealId);
    if (existingindex >=0) {
      setState(() {
        _favoriteMeal.removeAt(existingindex);
      });
    }
    else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.black,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData
                .light()
                .textTheme
                .copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              title: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
        routes: {
          '/': (ctx) => TabsScreen(_favoriteMeal),
          CategoryMealsScreen.routeName: (context) =>
              CategoryMealsScreen(_availablemeal),
          MealDetailsScreen.routeName: (context) =>
              MealDetailsScreen( _toggleFavorites,_isMealFavorite),
          FiltersScreen.routeName: (context) =>
              FiltersScreen(_filters, _setFilters),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEAL APP"),
      ),
      body: null,
    );
  }
}
