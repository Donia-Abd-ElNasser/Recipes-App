part of 'recipe_details_cubit.dart';

@immutable
abstract class RecipeDetailsState {}

class RecipeDetailsInitial extends RecipeDetailsState {}

class RecipeDetailsLoading extends RecipeDetailsState {}

class RecipeDetailsSuccess extends RecipeDetailsState {
  final RecipeDetails recipe;
  RecipeDetailsSuccess(this.recipe);
}

class RecipeDetailsFailure extends RecipeDetailsState {
  final String message;
  RecipeDetailsFailure(this.message);
}
