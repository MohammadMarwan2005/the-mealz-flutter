import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/core/filter_keyword_type.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/meals_by_category_response.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_area/meals_by_area_cubit.dart';
import 'package:equatable/equatable.dart';

part 'meals_by_category_dart_state.dart';

class MealsByCategoryDartCubit extends Cubit<MealsByCategoryDartState> {
  final ApiService apiService;

  MealsByCategoryDartCubit(this.apiService)
      : super(MealsByCategoryDartInitial());

  Future<void> getMeals(String category) async {
    emit(MealsByCategoryIsLoading());
    try {
      apiService.getMealsBy(category, FilterKeywordType.category).then((value) {
        if (value.meals != null) {
          emit(MealsByCategoryLoaded(loadedMeals: value.meals!));
        } else {
          emit(const MealsByCategoryError(message: "Something went wrong"));
        }
      });
    } catch (e) {
      emit(MealsByCategoryError(message: e.toString()));
    }
  }
}
