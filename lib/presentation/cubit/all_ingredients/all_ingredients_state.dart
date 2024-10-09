part of 'all_ingredients_cubit.dart';

abstract class AllIngredientsState extends Equatable {
  const AllIngredientsState();

  @override
  List<Object> get props => [];
}

class AllIngredientsInitial extends AllIngredientsState {}

class AllIngredientsIsLoading extends AllIngredientsState {}

class AllIngredientsError extends AllIngredientsState {
  final String message;

  const AllIngredientsError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllIngredientsLoaded extends AllIngredientsState {
  final List<IngredientDomainModel> loadedIngredients;

  const AllIngredientsLoaded({required this.loadedIngredients});

  @override
  List<Object> get props => [loadedIngredients];
}
