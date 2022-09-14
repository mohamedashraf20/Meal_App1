import 'package:Meal_App/screen/filters_screen.dart';
import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  Widget bulidlistTile(String title ,IconData icon , tapHandler){
    return ListTile(
      leading: Icon(icon ,size: 26,),
      title: Text(title,
      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      onTap: tapHandler,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cookinf up" , style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),),
          ),
          SizedBox(
            height: 20,
          ),
          bulidlistTile("Meal", Icons.restaurant,(){Navigator.of(context).pushReplacementNamed("/");}),
          bulidlistTile("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),


        ],
      ),
    );
  }
}
