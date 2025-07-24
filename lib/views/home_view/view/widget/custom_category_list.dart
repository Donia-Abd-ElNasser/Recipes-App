import 'package:flutter/material.dart';
import 'package:recipes_app/views/home_view/view/widget/custom_category_widget.dart';

class CategoryListView extends StatelessWidget {
   CategoryListView({super.key});
final List<String>categoryNamesList=[
'🍕  Pizza',
'🍗 Chicken',
'🥩 Beef',
'🐠 Seafood',
'🍩 Dessert',
'🍞 Breakfast',
'🥩 Goat',
'🥩 Lamb',
'🥣 Soup',
'🥗 Vegetables',

];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,),
            child: GestureDetector
            (
              onTap: (){
                
              },
              
              
              child: CategoryWidget(categoryName: categoryNamesList[index],)),
          );}),
    );
     
}}