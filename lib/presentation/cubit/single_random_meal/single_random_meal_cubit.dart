import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/full_meal_response.dart';
import 'package:equatable/equatable.dart';

part 'single_random_meal_state.dart';

class SingleRandomMealCubit extends Cubit<SingleRandomMealState> {
  final ApiService apiService;

  SingleRandomMealCubit(this.apiService) : super(SingleRandomMealInitial());

  Future<void> getARandomMeal() async {
    emit(SingleRandomMealIsLoading());
    apiService.getARandomMeal().then((value) {
      try {
        emit(SingleRandomMealLoaded(loadedMeal: value));
      } catch (e) {
        emit(SingleRandomMealError(message: e.toString()));
      }
    });
  }
}
