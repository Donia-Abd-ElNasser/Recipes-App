import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:recipes_app/core/constants.dart';
import 'package:recipes_app/views/recipes_details_view/view/widget/custom_button.dart';

import 'package:recipes_app/views/recipes_details_view/view/widget/resources_button.dart';

class DraggableSheet extends StatelessWidget {
  const DraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kWidgetColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Recipe Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: kGtsectrafont,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                
                Row(
               
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    ResourcesButton(
                      name: 'YouTube',
                      color: const Color.fromARGB(255, 186, 31, 20),
                      icon: FontAwesomeIcons.youtube,
                      onTap: (){},
                    ),
                    ResourcesButton(
                      onTap: (){},
                      name: 'Source',
                      color: const Color.fromARGB(255, 3, 92, 6),
                      icon: FontAwesomeIcons.earthEurope,
                    ),
                  ],
                ),
                  SizedBox(height: 20),
                  Row(
                   
                      children: [
           CustomButton(text: 'Ingredient',onTap: (){},),
           CustomButton(text: 'Recipe',onTap: (){})
                      ],
                    ),
                  
              ],
            ),
          ),
        );
      },
    );
  }
}
