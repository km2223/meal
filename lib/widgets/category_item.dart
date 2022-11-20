import 'package:flutter/material.dart';

import '../screens/caregory_meal_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String color;
   CategoryItem(this.id,this.title, this.color);
     void selectedCategory(BuildContext context){
      CategoryMealsScreen.routeName;
    Navigator.of(context).pushNamed(
      '/categories-meals',arguments: {
        'id':id,'title':title
      }
    );
   
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () =>selectedCategory (context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      child: Container(
        padding:const EdgeInsets.all(15),
        child: Text(title,
        style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.amber.withOpacity(0.7),
            Colors.redAccent.withOpacity(0.7),
    
            
          ],
          begin:Alignment.topLeft,
          end: Alignment.bottomRight
          ),
          borderRadius:BorderRadius.circular(15)
        ),
    
      ),
    );
  }
}