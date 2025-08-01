import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/core/utils/constants.dart';

import 'package:recipes_app/views/home_view/view/widget/custom_category_list.dart';
import 'package:recipes_app/views/home_view/view/widget/custom_grey_text.dart';

import 'package:recipes_app/views/home_view/view/widget/recipe_items_list.dart';
import 'package:recipes_app/views/home_view/view_model/meals/meals_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Hey, $userName',
                    style: TextStyle(fontSize: 25, fontFamily: kGtsectrafont),
                  ),
                  CustomGreyText(text: 'Ready to cook something ?'),
                  SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meal Category',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: kGtsectrafont,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.list,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10),
                  CategoryListView(),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (value) {
                        final search = capitalize(value.trim());
                        if (search.isNotEmpty) {
                          BlocProvider.of<MealsCubit>(
                            context,
                          ).SearchRecipe(searchWord: search);
                        } else {
                          BlocProvider.of<MealsCubit>(context).fetchAllMeals();
                        }
                      },
                      cursorColor: kButtonColor,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: kButtonColor),
                        labelStyle: TextStyle(color: kButtonColor),
                        hintText: 'Search',
                        suffixIcon: IconButton(
                          onPressed: () {
                            final search = capitalize(
                              _searchController.text.trim(),
                            );
                            if (search.isNotEmpty) {
                              BlocProvider.of<MealsCubit>(
                                context,
                              ).SearchRecipe(searchWord: search);
                            } else {
                              BlocProvider.of<MealsCubit>(
                                context,
                              ).fetchAllMeals();
                            }
                          },
                          icon: Icon(CupertinoIcons.search),
                          color: kButtonColor,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  //  CategoryItem(),
                ],
              ),
            ),

            //
            SliverToBoxAdapter(child: RecipesItemsList()),
          ],
        ),
      ),
    );
  }
}

String capitalize(String word) {
  if (word.isEmpty) return word;
  return word[0].toUpperCase() + word.substring(1);
}
