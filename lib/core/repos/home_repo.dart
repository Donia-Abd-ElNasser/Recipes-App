import 'package:dartz/dartz.dart';
import 'package:recipes_app/core/errors/failure.dart';
import 'package:recipes_app/views/home_view/model/category_list_model.dart';

abstract class HomeRepo {
  Future <Either<Failure,List<Meal>>>fetchCategories({required String catName});
  Future<Either<Failure,List<Meal>>> fetchAllMeals();
}