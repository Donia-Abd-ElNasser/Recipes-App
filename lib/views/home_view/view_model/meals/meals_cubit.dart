// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:recipes_app/core/repos/home_repo.dart';
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
}
