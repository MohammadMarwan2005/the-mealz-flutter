part of 'all_categories_dart_cubit.dart';

abstract class AllCategoriesDartState extends Equatable {
  const AllCategoriesDartState();
}

class AllCategoriesDartInitial extends AllCategoriesDartState {
  @override
  List<Object?> get props => [];
}

class AllCategoriesLoaded extends AllCategoriesDartState {
  final List<CategoryNetworkModel> loadedCategories;
  const AllCategoriesLoaded({required this.loadedCategories});

  @override
  List<Object?> get props => [loadedCategories];
}

class AllCategoriesIsLoading extends AllCategoriesDartState {
  @override
  List<Object?> get props => [];
}

class AllCategoriesError extends AllCategoriesDartState {
  final String message;
  const AllCategoriesError({required this.message});

  @override
  List<Object?> get props => [message];
}
