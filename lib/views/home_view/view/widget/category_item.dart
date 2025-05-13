import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/constants.dart';
import 'package:recipes_app/core/routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
            GoRouter.of(context).push(AppRoutes.kRecipesDetailsView);
          },
        child: Container(
          width: MediaQuery.of(context).size.width / 2.3,
         // height: 40,
          decoration: BoxDecoration(
            color: kWidgetColor,
            borderRadius: BorderRadius.circular(25),
          ),
        
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 105,
                right: 48,
                child: Image.asset(
                  'assets/chickenByrani 1.jpg',
                  height: 80,
                  width: 50,
                ),
              ),
                  
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'chicken',
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: kGtsectrafont,
                      fontSize: 18,
                    ),
                  ),
                  Text('⭐⭐⭐⭐⭐', style: const TextStyle(fontSize: 12)),
                  SizedBox(height: 5),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                                         // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(FontAwesomeIcons.earthAfrica, size: 16),
                          SizedBox(width: 5),
                          Text(
                            'Japanese',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: kGtsectrafont,
                            ),
                          ), //SizedBox(width: 5),
                          IconButton(onPressed: (){
                           
                                  GoRouter.of(context).push(AppRoutes.kRecipesDetailsView);
                              
                          }, icon: Icon(FontAwesomeIcons.solidBookmark ,size: 16,))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
