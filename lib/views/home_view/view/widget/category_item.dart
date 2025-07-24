// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:recipes_app/core/utils/constants.dart';
import 'package:recipes_app/core/utils/routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.image, required this.name})
    : super(key: key);
  final int selected = 0;
  final String image;

  final String name;

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
          decoration: BoxDecoration(
            color: kWidgetColor,
            borderRadius: BorderRadius.circular(25),
          ),

          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 85,
                right: 40,
                child: ClipRRect(
                  borderRadius:   BorderRadius.circular(250),
                  child: Image.network(image, height: 80, width: 80)),
              ),

              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   //crossAxisAlignment: CrossAxisAlignment,
                  children: [
                    SizedBox(height: 80),
                    Text(
                      name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: kGtsectrafont,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('⭐⭐⭐⭐⭐', style: const TextStyle(fontSize: 12)),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.solidBookmark, size: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
