import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/core/filter_keyword_type.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/meals_by_category_response.dart';
import 'package:equatable/equatable.dart';

part 'meals_by_ingredient_state.dart';

class MealsByIngredientCubit extends Cubit<MealsByIngredientState> {
  final ApiService apiService;
  MealsByIngredientCubit(this.apiService) : super(MealsByIngredientInitial());
  Future<void> getMealsByIngredient(String ingredeintName) async {
    emit(MealsByIngredientIsLoading());
    try {
      await apiService
          .getMealsBy(ingredeintName, FilterKeywordType.ingredient)
          .then(
        (value) {
          if (value.meals != null) {
            emit(MealsByIngredientLoaded(loadedMeals: value.meals!));
          } else {
            emit(
                const MealsByIngredientError(message: "Something went wrong!"));
          }
        },
      );
    } catch (e) {
      emit(MealsByIngredientError(message: e.toString()));
    }
  }
}
