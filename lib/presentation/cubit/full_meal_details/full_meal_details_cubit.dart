import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/full_meal_response.dart';
import 'package:equatable/equatable.dart';

part 'full_meal_details_state.dart';

class FullMealDetailsCubit extends Cubit<FullMealDetailsState> {
  final ApiService apiService;
  FullMealDetailsCubit(this.apiService) : super(FullMealDetailsInitial());

  Future<void> getFullMealById(int id) async {
    emit(FullMealDetailsIsLoading());
    try {
      final FullMealDomainModel fullMealDomainModel =
          await apiService.getFullMealDetails(id);
      emit(FullMealDetailsLoaded(loadedMeal: fullMealDomainModel));
    } catch (e) {
      emit(FullMealDetailsError(message: e.toString()));
    }
  }
}
