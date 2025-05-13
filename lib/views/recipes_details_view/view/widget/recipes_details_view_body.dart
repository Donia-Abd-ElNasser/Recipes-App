import 'package:flutter/material.dart';

import 'package:recipes_app/views/recipes_details_view/view/widget/app_bar.dart';

import 'draggable_sheet.dart';

class RecipesDetailsViewBody extends StatelessWidget {
  const RecipesDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child:  Stack(
     // fit: StackFit.expand,
        children: [
         
          Container(
            height: 550,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splashImage2.jpg'),
               fit: BoxFit.cover,
              ),
            ),
          ),
         
           CustomAppBar(),
          
           DraggableSheet(),
        ],
      ),
    );
    
  }
}