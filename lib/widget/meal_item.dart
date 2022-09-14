import 'package:Meal_App/module/meal.dart';
import 'package:Meal_App/screen/Meal_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imgeurl;
  final Complexity complexity;
  final Affordability affordability;


  const MealItem(
      { @required this.id,
      @required this.title,
      @required this.duration,
      @required this.imgeurl,
      @required this.complexity,
      @required this.affordability});


  String get complexityText{
    switch(complexity){
      case Complexity.Simple : return"simple"; break;
      case Complexity.Challenging : return"Challenging"; break;
      case Complexity.Hard : return"Hard"; break;
      default: return  "unfound"; break;

    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable : return"Affordable"; break;
      case Affordability.Pricey: return"Pricey"; break;
      case Affordability.Luxurious : return"Luxurious "; break;
      default: return  "unfound"; break;

    }
  }


  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName,arguments: id,).then((result) {

    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgeurl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: 250,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text("$duration min"),
                    ],
            ),


                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            ),
          ])),
    );
  }
}
