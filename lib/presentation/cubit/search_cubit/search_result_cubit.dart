import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/full_meal_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  final ApiService apiService;
  TextEditingController searchController = TextEditingController();
  SearchResultCubit(this.apiService) : super(SearchResultInitial());


  Future<void> getSearchResults(String keyword) async {
    emit(SearchResultIsLoading());
    try {
      apiService.getSearchResultMeals(keyword).then((loadedMeals) {
        emit(SearchResultLoaded(loadedMeals));
      });
    } catch(e) {
      emit(SearchResultError(e.toString()));
    }
  }
}
