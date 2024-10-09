import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/all_ingredients_response.dart';
import 'package:equatable/equatable.dart';

part 'all_ingredients_state.dart';

class AllIngredientsCubit extends Cubit<AllIngredientsState> {
  final ApiService apiService;
  AllIngredientsCubit(this.apiService) : super(AllIngredientsInitial());

  Future<void> getAllIngredients() async {
    emit(AllIngredientsIsLoading());
    try {
      final List<IngredientDomainModel> loadedIngredients =
          await apiService.getAllIngredients();
      emit(AllIngredientsLoaded(loadedIngredients: loadedIngredients));
    } catch (e) {
      emit(AllIngredientsError(message: e.toString()));
    }
  }
}
