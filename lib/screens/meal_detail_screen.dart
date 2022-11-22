import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummu_data.dart';


class MealDetailScreen extends StatelessWidget {
static const routeName='/meal-detail';
Widget buildSectionTitle(BuildContext context,String text){
           return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text(text,style: Theme.of(context).textTheme.titleMedium ,),
            ),
          );

}
Widget buildContainer(Widget child){
           return Container(
            decoration: BoxDecoration(color: Colors.white,border:Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
            height: 100,
            width: 300,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: child,);

  
}

  @override
  Widget build(BuildContext context) {
final mealId=ModalRoute.of(context).settings.arguments as String;
final selectMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);


    return Scaffold(
      appBar: AppBar(title: Text('${selectMeal.title }'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              
              width: double.infinity
              ,height: 300,
              child: Image.network(selectMeal.imageUrl,
              fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'ingredients'),
      
      
              buildContainer(
              ListView.builder(
                itemBuilder:(context, index) => Card(
                  color:Theme.of(context).colorScheme.secondary,
                  child:Text(selectMeal.ingredients[index]),
      
              ) ,
              itemCount: selectMeal.ingredients.length
               ) ,
      
            ),
               buildSectionTitle(context, 'Steps'),
               buildContainer(ListView.builder(itemBuilder: (context, index) => Column(children: [ListTile(
                leading: CircleAvatar(
                  child: Text('#${index+1}'),
                
                ),
                title: Text(selectMeal.steps[index]),
              
               ),Divider()],) 
               ,itemCount: selectMeal.steps.length,
               )
      
               ),
      
      
            
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(
          Icons.delete),
          onPressed: (() {
            Navigator.of(context).pop(mealId);
          }),
          ),
    );
   
  }
}