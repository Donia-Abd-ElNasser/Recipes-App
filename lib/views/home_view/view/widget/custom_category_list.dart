import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/views/home_view/view/widget/custom_category_widget.dart';
import 'package:recipes_app/views/home_view/view_model/meals/meals_cubit.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});
  final List<String> categoryNamesList = [
    '🌯 Pork',
    '🍗 Chicken',
    '🥩 Beef',
    '🐠 Seafood',
    '🍩 Dessert',
    '🍞 Breakfast',
    '🥩 Goat',
    '🥩 Lamb',
    '🥔 Side',
    '🥗 Vegan',
    //'🌽Miscellaneous',
    '🍚 Starter',
    '🫑 Vegetarian',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryNamesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
  final category = categoryNamesList[index].split(' ').last;
 BlocProvider.of<MealsCubit>(context).fetchCategories(catName: category);
},


              child: CategoryWidget(categoryName: categoryNamesList[index]),
            ),
          );
        },
      ),
    );
  }
}
