import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:recipes_app/views/recipes_details_view/view/widget/app_bar.dart';
import 'package:recipes_app/views/recipes_details_view/view_model/recipe_deatails/recipe_details_cubit.dart';

import 'draggable_sheet.dart';

class RecipesDetailsViewBody extends StatelessWidget {
  const RecipesDetailsViewBody({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
      builder: (context, state) {
        if (state is RecipeDetailsSuccess){
 return SafeArea(
          child: Stack(
            // fit: StackFit.expand,
            children: [
              Container(
                height: 550,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(state.recipe.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              CustomAppBar(id: id,),

              DraggableSheet(recipe: state.recipe,),
            ],
          ),
        );}
        else if (state is RecipeDetailsFailure){
          return   Text(state.message,style: TextStyle(fontSize: 10),);
        }
        else {
           return Center(child: CircularProgressIndicator());
        }
       
      },
    );
  }
}
