import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class SavedRecipeCubit extends Cubit<Set<String>> {
  SavedRecipeCubit() : super(<String>{});
   void toggleSave(String recipeId) {
    final current = Set<String>.from(state);
    if (current.contains(recipeId)) {
      current.remove(recipeId);
    } else {
      current.add(recipeId);
    }
    emit(current);
  }

  bool isSaved(String recipeId) => state.contains(recipeId);
}
