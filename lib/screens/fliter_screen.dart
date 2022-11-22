import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
class FilterScreen extends StatefulWidget {
  static const routeName='/filters';
  final Function saveFliter;
  final Map<String,bool>_currentFilter;
  FilterScreen(this._currentFilter,this.saveFliter);

   

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree=false;
  bool _isVegan=false ;
  bool _isVegetarian=false ;
  bool _isLactoseFree=false ;
  @override
  void initState() {
    _isGlutenFree=widget._currentFilter['gluten'];
    _isVegan=widget._currentFilter['vegan'];
    _isVegetarian=widget._currentFilter['vegetarian'];
    _isGlutenFree=widget._currentFilter['lactose'];

    super.initState();
  }
  Widget _buildSwitchTile(String title,String Describtion,bool currentValue,Function updateValue){
    return SwitchListTile(
                title: Text(title),
                value: currentValue, 
                subtitle: Text(Describtion),
                onChanged:updateValue

                );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Favorite"),
        actions: [
          IconButton(onPressed: (){
            final selectedFilter={
                  'gluten':_isGlutenFree,
                  'lactose':_isLactoseFree,
                 'vegan':_isVegan,
                 'vegetarian':_isVegetarian,
            };
            widget.saveFliter(selectedFilter);},
             icon: Icon(Icons.save))
        ],
        
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust Your meal selection',
            style: Theme.of(context).textTheme.titleMedium,
            
            ),

          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchTile('GlutenFree', 'only include free GlutenFree meal ', _isGlutenFree, 
              (newValue){
                setState(() {
                  _isGlutenFree=newValue;
                });
              }
              ),
              _buildSwitchTile('Vegan', 'only include vegan meal ', _isVegan, 
              (newValue){
                setState(() {
                  _isVegan=newValue;
                });
              }
              ),
               _buildSwitchTile('Vegetarian', 'only include Vegetarian meal ', _isVegetarian, 
              (newValue){
                setState(() {
                  _isVegetarian=newValue;
                });
              }
              ),
               _buildSwitchTile('LactoseFree', 'only include LactoseFree meal ', _isLactoseFree, 
              (newValue){
                setState(() {
                  _isLactoseFree=newValue;
                });
              }
              ),
              
              

            ],
          )
          )
        ],
      ),
    );
  }
}