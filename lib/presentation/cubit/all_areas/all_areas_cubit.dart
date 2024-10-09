import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/all_areas_response.dart';
import 'package:equatable/equatable.dart';

part 'all_areas_state.dart';

class AllAreasCubit extends Cubit<AllAreasState> {
  final ApiService apiService;

  AllAreasCubit(this.apiService) : super(AllAreasInitial());

  Future<void> getAllAreas() async {
    emit(AllAreasIsLoading());
    try {
      List<AreaDomainModel> loadedAreas = await apiService.getAllAreas();
      emit(AllAreasLoaded(loadedAreas: loadedAreas));
    } catch (e) {
      emit(AllAreasError(message: e.toString()));
    }
  }
}
