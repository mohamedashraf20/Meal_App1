import 'package:Meal_App/widget/main_drawe.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "Filters";
  final Function saveFilters;
  final Map<String , bool> currentFilters;


  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  initState(){
     _isGlutenFree = widget.currentFilters['gluten'];
     _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue ,
        subtitle: Text(description),
        onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your filters"),
        actions: [
          IconButton(icon: Icon(Icons.save),
              onPressed: () {
            final Map<String , bool >selectedFilters ={
            'gluten':_isGlutenFree,
            'lactose':_isLactoseFree,
            'vegan':_isVegan,
            'vegetarian':_isVegetarian,
            };
                widget.saveFilters(selectedFilters);
              },
          ),
        ],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "adjust your meal selection",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            buildSwitchListTile(
              "Gluten_free",
              "only include gluten_free meals ",
              _isGlutenFree,
              (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              },
            ),
            buildSwitchListTile(" lactose_free",
                "only include Lactose_free meals ", _isLactoseFree,
                    (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            }),
            buildSwitchListTile(
                "Vegetarian", "only include Vegetarian meals ", _isVegetarian,
                (newValue) {
              setState(() {
                _isVegetarian = newValue;
              });
            }),
            buildSwitchListTile("Vegan", "only include Vegan meals ", _isVegan,
                (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            }),
          ],
        ))
      ]),
      drawer: MainDrawer(),
    );
  }
}
