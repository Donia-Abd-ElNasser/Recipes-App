import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/core/utils/constants.dart';

import 'package:recipes_app/views/home_view/view/widget/custom_category_list.dart';
import 'package:recipes_app/views/home_view/view/widget/custom_grey_text.dart';
import 'package:recipes_app/views/home_view/view/widget/custom_onboarding_widget.dart';
import 'package:recipes_app/views/home_view/view/widget/recipe_items_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Hey, Donia',
                    style: TextStyle(fontSize: 25, fontFamily: kGtsectrafont),
                  ),
                  CustomGreyText(text: 'Ready to cook something ?'),
                  SizedBox(height: 20),
                  CustomOnBoardingWidget(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  SizedBox(height: 10),
                  CategoryListView(),
                //  CategoryItem(),
                ],
              ),
            ),

           
           //  
            

           
            SliverToBoxAdapter(
              child: RecipesItemsList()
            ),
          ],
        ),
      ),
   
   );
  }
}