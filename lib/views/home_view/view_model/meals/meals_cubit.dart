// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipes_app/core/errors/failure.dart';

import 'package:recipes_app/core/repos/home_repo.dart';
import 'package:recipes_app/views/home_view/model/category_list_model.dart';
import 'package:recipes_app/views/home_view/view_model/meals/meals_state.dart';

class MealsCubit extends Cubit<MealState> {
  MealsCubit(this.homeRepo) : super(MealInitial());
  final HomeRepo homeRepo;
  Future<void> fetchAllMeals() async {
    emit(MealLoading());
    var result = await homeRepo.fetchAllMeals();
    result.fold(
      (failure) {
        emit(MealFailure(failure.errMessage));
      },
      (meals) {
        emit(MealSuccess(meals));
      },
    );
  }
   Future<void>fetchCategories({required String catName})async{
var data=await homeRepo.fetchCategories(catName: catName);
data.fold((failure) {
        emit(MealFailure(failure.errMessage));
      },
      (meals) {
        emit(MealSuccess(meals));
      });
  }
  Future<void>SearchRecipe({required String searchWord})async{
var data=await homeRepo.SearchRecipe(searchWord: searchWord);
data.fold((failure) {
        emit(MealFailure(failure.errMessage));
      },
      (meals) {
        emit(MealSuccess(meals));
      });
  }
  

}
