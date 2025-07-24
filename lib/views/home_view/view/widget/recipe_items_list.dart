import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/views/home_view/view/widget/category_item.dart';
import 'package:recipes_app/views/home_view/view_model/meals/meals_cubit.dart';
import 'package:recipes_app/views/home_view/view_model/meals/meals_state.dart';

class RecipesItemsList extends StatelessWidget {
  const RecipesItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCubit, MealState>(
      builder: (context, state) {
        if (state is MealSuccess) {
          return GridView.builder(
            itemCount: state.meals.length,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
            ),
            physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryItem(image: state.meals[index].imageUrl,  name: state.meals[index].name);
            },
          );
        }else if (state is MealLoading){
          return Center(child: CircularProgressIndicator());
        }else if (state is MealFailure) {
          return Text(state.message,style: TextStyle(fontSize: 10),);
        }else { return Text('No data');}
      },
    );
  }
}
