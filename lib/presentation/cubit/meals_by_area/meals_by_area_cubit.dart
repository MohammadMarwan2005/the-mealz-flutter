import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/core/filter_keyword_type.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/meals_by_category_response.dart';
import 'package:equatable/equatable.dart';

part 'meals_by_area_state.dart';

class MealsByAreaCubit extends Cubit<MealsByAreaState> {
  final ApiService apiService;
  MealsByAreaCubit(this.apiService) : super(MealsByAreaInitial());

  Future<void> getMeals(String areaName) async {
    emit(MealsByAreaIsLoading());
    try {
      apiService.getMealsBy(areaName, FilterKeywordType.area).then(
        (mealsByCategoryResponse) {
          if (mealsByCategoryResponse.meals != null) {
            emit(
                MealsByAreaLoaded(loadedMeals: mealsByCategoryResponse.meals!));
          } else {
            emit(const MealsByAreaError(message: "Something went wrong"));
          }
        },
      );
    } catch (e) {
      emit(MealsByAreaError(message: e.toString()));
    }
  }
}
