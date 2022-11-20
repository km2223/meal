

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/fliter_screen.dart';


class MainDrawer  extends StatelessWidget {
Widget buildListTile(String title,IconData icon,Function tabhandler){
           return ListTile(
          leading: Icon(icon,size: 26,),
          title: Text(title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight:FontWeight.bold
          ),
          ),
          onTap: tabhandler,
        );

}
  @override
  Widget build(BuildContext context) {
    return Drawer(child:Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text("data",
          style:TextStyle(
            fontWeight:FontWeight.w900,
            fontSize: 30,
            color:Theme.of(context).primaryColor,

          ),
          ),
        ),
        SizedBox(height: 20,),
        buildListTile('meal', 
        Icons.settings,
        (){
          Navigator.of(context).pushNamed('/');
        }
        ),
        buildListTile('filter',
         Icons.restaurant,
         (){
          Navigator.of(context).pushNamed(FilterScreen.routeName);

         }
         )

   
      ],
    ),
    );
  }
}