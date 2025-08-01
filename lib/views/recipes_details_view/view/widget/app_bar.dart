import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/views/saved_view/view_model/savedRecipe/saved_recipe_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedRecipeCubit, Set<String>>(
      builder: (context, savedRecipes) {
        final isSaved = savedRecipes.contains(id);
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: Colors.orange,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: () {
                    BlocProvider.of<SavedRecipeCubit>(
                      context,
                    ).toggleSave(id);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
