import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/views/recipes_details_view/view/widget/recipes_details_view_body.dart';

class RecipesDetailsView extends StatelessWidget {
  const RecipesDetailsView({super.key, required this.id});
final String id;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      //appBar:AppBar(title: Text('widget'),) ,
      body: RecipesDetailsViewBody(id:id),
    );
  }
}