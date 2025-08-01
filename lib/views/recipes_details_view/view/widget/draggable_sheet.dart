import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:recipes_app/core/utils/constants.dart';
import 'package:recipes_app/views/recipes_details_view/model/recipe_details.dart';
import 'package:recipes_app/views/recipes_details_view/view/widget/custom_button.dart';
import 'package:recipes_app/views/recipes_details_view/view/widget/custom_table.dart';

import 'package:recipes_app/views/recipes_details_view/view/widget/resources_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DraggableSheet extends StatefulWidget {
   DraggableSheet({super.key, required this.recipe});
  final RecipeDetails recipe;

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
bool isSelected=false;

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
                    widget.recipe.recipeName,
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
                      onTap: () {
                        _launchUrl(widget.recipe.youTubeUrl);
                      },
                    ),
                    ResourcesButton(
                      onTap: () {
                        _launchUrl(
                          widget.recipe.sourceUrl ?? 'https://www.talabat.com/egypt',
                        );
                      },
                      name: 'Source',
                      color: const Color.fromARGB(255, 3, 92, 6),
                      icon: FontAwesomeIcons.earthEurope,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CustomButton(text: 'Ingredient', onTap: () {
                      setState(() {
                         isSelected=false;
                      });
                     }),
                    CustomButton(text: 'Recipe', onTap: () {
                      setState(() {
                        isSelected=true;
                      });
                      }),
                  ],
                ),
                SizedBox(height: 16),

                 SizedBox(
                  height: 350,
                  child: ListView(
                    shrinkWrap: true,
                  
                    children: [
                      if (isSelected)
                        CustomTable(
                            ingredientsList: widget.recipe.recipeTable)
                      else
                        Text(
                          widget.recipe.recipeInstructions,
                          style: const TextStyle(fontSize: 14, height: 1.5),
                        ),
                    ],
                  ),
                                 ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void _launchUrl(String urlString) async {
  final url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch $url');
  }
}
