import 'package:flutter/material.dart';
import 'package:recipes_app/views/recipes_details_view/view/widget/app_bar.dart';
import 'package:recipes_app/views/recipes_details_view/view/widget/recipes_details_view_body.dart';

class RecipesDetailsView extends StatelessWidget {
  const RecipesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('widget'),) ,
      body: RecipesDetailsViewBody(),
    );
  }
}