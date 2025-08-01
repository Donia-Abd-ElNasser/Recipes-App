import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/core/errors/failure.dart';

import 'package:recipes_app/views/recipes_details_view/model/recipe_details.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit() : super(RecipeDetailsInitial());
  Future<Either<Failure, RecipeDetails>>fetchRecipe({required String id})async{
    emit(RecipeDetailsLoading());
    print('Fetching recipe with id: $id');
try {
  var response=await Dio().get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
  final data=response.data['meals'];
  if (data != null && data is List && data.isNotEmpty) {
        final recipe = RecipeDetails.fromJson(data[0]);
        emit(RecipeDetailsSuccess(recipe));
        return Right(recipe);
      } else {
        final message = "No recipe found for this ID";
        emit(RecipeDetailsFailure(message));
        return Left(ServerFailure(errMessage: message));
      }
} on DioException catch (e) {
  return Left(ServerFailure.fromDioError(e));
} catch (e){
return Left(ServerFailure(errMessage: e.toString()));
}
  } 
}
