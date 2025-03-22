import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/constants.dart';
import 'package:recipes_app/core/routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        height: 100,
        decoration: BoxDecoration(
          color: kWidgetColor,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kRecipesDetailsView);
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 90,
                  right: 40,
                  child: Image.asset(
                    'assets/chickenByrani 1.jpg',
                    height: 80,
                    width: 50,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height:8,),
                    Text(
                      'chicken',
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: kGtsectrafont,
                        fontSize: 16,
                      ),
                    ),
                    Text('⭐⭐⭐⭐⭐', style: const TextStyle(fontSize: 12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                       //   mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '10',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 170, 167, 167),
                                fontFamily: kGtsectrafont,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Min',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 170, 167, 167),
                                fontFamily: kGtsectrafont,
                                fontSize: 18,
                              ),),
                          ],
                        ),
                  Text(
                              '|\n|',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 170, 167, 167),
                                fontFamily: kGtsectrafont,
                                fontSize: 16,
                              ),
                            ),
                         Column(
                       //   mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Easy',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 170, 167, 167),
                                fontFamily: kGtsectrafont,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'lvl',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 170, 167, 167),
                                fontFamily: kGtsectrafont,
                                fontSize: 18,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




 
                         