import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipes_app/core/errors/failure.dart';
import 'package:recipes_app/core/repos/home_repo.dart';
import 'package:recipes_app/core/utils/services.dart';
import 'package:recipes_app/views/home_view/model/category_list_model.dart';
import 'package:recipes_app/views/home_view/view_model/meals/meals_state.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<Meal>>> fetchAllMeals() async {
  
    final List<Meal> allMeals = [];
     
    try {
      
      var data = await apiServices.get(endPoint: 'list.php?c=list');
      final categories = data['meals'];

      for (var cat in categories) {
        var catName = cat['strCategory'];
        var res = await apiServices.get(endPoint: 'filter.php?c=$catName');
        for (var meal in res['meals']) {
          allMeals.add(Meal.fromJson(meal));
        }
      }
      return Right(allMeals);
    } on Exception catch (e) {
       if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Meal>>> fetchCategories({
    required String catName,
  }) async {
    try {
      var data = await apiServices.get(endPoint: 'filter.php?c=$catName');

      return right(data['meals']);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
