import 'package:recipes_app/views/home_view/model/category_list_model.dart';



abstract class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealSuccess extends MealState {
  final List<Meal> meals;
  MealSuccess(this.meals);
}

class MealFailure extends MealState {
  final String message;
  MealFailure(this.message);
}
