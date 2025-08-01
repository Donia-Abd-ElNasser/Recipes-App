class RecipeDetails {
  final String recipeName;
  final String recipeInstructions;
  final String youTubeUrl;
  final String imageUrl;
  final String sourceUrl;
  //final String recipe;
  final List<Ingredient> recipeTable;

  RecipeDetails({
    required this.imageUrl,
    required this.recipeTable,
    required this.recipeName,
    required this.recipeInstructions,
    required this.youTubeUrl,
    required this.sourceUrl,
  });

  factory RecipeDetails.fromJson(json) {
    List<Ingredient> ingredientsList = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null &&
          ingredient.toString().trim().isNotEmpty &&
          measure != null &&
          measure.toString().trim().isNotEmpty) {
        ingredientsList.add(
          Ingredient(
            name: ingredient.toString().trim(),
            measure: measure.toString().trim(),
          ),
        );
      }
    }

    return RecipeDetails(
      imageUrl: json['strMealThumb'],
      recipeName: json['strMeal'],
      recipeInstructions: json['strInstructions'],
      youTubeUrl: json['strYoutube'],
      sourceUrl: json['strSource'],
      recipeTable: ingredientsList,
    );
  }
}

class Ingredient {
  final String name;
  final String measure;

  Ingredient({required this.name, required this.measure});
}
