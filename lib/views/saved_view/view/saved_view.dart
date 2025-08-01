import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/utils/constants.dart';

import 'package:recipes_app/views/saved_view/view_model/savedRecipe/saved_recipe_cubit.dart'; 

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: kButtonColor,onPressed: (){
          GoRouter.of(context).pop();
        },),
        title: Text('Saved Recipes',style: TextStyle(color: kButtonColor),)),
      body: BlocBuilder<SavedRecipeCubit, Set<String>>(
        builder: (context, savedRecipeIds) {
          if (savedRecipeIds.isEmpty) {
            return Center(child: Text('No recipes saved yet.',style: TextStyle(color: kButtonColor)));
          }

          return ListView.builder(
            itemCount: savedRecipeIds.length,
            itemBuilder: (context, index) {
              final recipeId = savedRecipeIds.elementAt(index);

           
              return ListTile(
                title: Text('Recipe $recipeId'), // Placeholder
                trailing: Icon(Icons.bookmark, color: kButtonColor),
                onTap: () {
                  GoRouter.of(context).push('/recipesDetailsView', extra: recipeId);
                },
              );
            },
          );
        },
      ),
    );
  }
}
