import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/data/model/all_categories_response.dart';
import 'package:bloc_state_management/data/repo/all_categories_repo.dart';
import 'package:equatable/equatable.dart';

part 'all_categories_dart_state.dart';

class AllCategoriesDartCubit extends Cubit<AllCategoriesDartState> {
  final AllCategoriesRepo allCategoriesRepo;

  AllCategoriesDartCubit(this.allCategoriesRepo)
      : super(AllCategoriesDartInitial());

  Future<void> getAllCategories() async {
    emit(AllCategoriesIsLoading());
    try {
      final categories = await allCategoriesRepo.getAllCategories();
      emit(AllCategoriesLoaded(loadedCategories: categories));
    } catch (e) {
      emit(AllCategoriesError(message: e.toString()));
    }
  }
}
