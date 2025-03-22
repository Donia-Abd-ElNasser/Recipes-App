
import 'package:flutter/material.dart';
import 'package:recipes_app/views/home_view/view/widget/category_item.dart';

class RecipesItemsList extends StatelessWidget {
  const RecipesItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                itemCount: 30,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),  physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CategoryItem();
  });
}}