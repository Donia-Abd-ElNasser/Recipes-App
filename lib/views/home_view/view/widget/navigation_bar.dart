import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/utils/constants.dart';
import 'package:recipes_app/core/utils/routes.dart';


class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color:  kWidgetColor,
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
           Opacity(
      opacity: 0.7,
     
        child: IconButton(
          iconSize: 25,
          color: kPrimaryColor,
          onPressed: () {
            
              GoRouter.of(context).push(AppRoutes.kHomeView);
            },
          icon:Center(child: Icon( FontAwesomeIcons.house,)),
        ),
     
    ),
           Opacity(
      opacity: 0.7,
     
        child: IconButton(
          iconSize: 22,
          color: kPrimaryColor,
          onPressed: () {
               GoRouter.of(context).push(AppRoutes.kSavedView);
            },
          icon: Center(child:Icon(FontAwesomeIcons.solidBookmark),
        ),
     
    ),),
          
          Opacity(
      opacity: 0.7,
     
        child: IconButton(
          iconSize: 30,
          color: kPrimaryColor,
          onPressed: () {
               GoRouter.of(context).push(AppRoutes.kProfileView);
            },
          icon: Center(child:Icon(Icons.person),
        ),
     
    ),),
          
        ],
      ),
    );
  }
}