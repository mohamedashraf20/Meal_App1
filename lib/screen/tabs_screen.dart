import 'package:Meal_App/module/meal.dart';
import 'package:Meal_App/screen/categories_screen.dart';
import 'package:Meal_App/screen/fevorite_screen.dart';
import 'package:Meal_App/widget/main_drawe.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritemeal;
  const TabsScreen( this.favoritemeal) ;


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>>_page;

  int _selectedpageIndex =0;
  @override
  void initState(){
   _page =[
    {

    'page' : CategoriesScreen(),
    'title' : 'your Favorite',
    },
    {
    'page' : FavoriteScreen(widget.favoritemeal),
    'title' : 'your Favorite',
    },
    ];
  }

  void _selectpage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedpageIndex]['title'])),


      body: _page[_selectedpageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
      backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.category),
            title: Text("categories")

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("favorite"),

          )
        ],
      ),
      drawer: MainDrawer(),

    );
  }


}
