part of 'meals_by_ingredient_cubit.dart';

abstract class MealsByIngredientState extends Equatable {
  const MealsByIngredientState();
}

class MealsByIngredientInitial extends MealsByIngredientState {
  @override
  List<Object?> get props => [];
}

class MealsByIngredientIsLoading extends MealsByIngredientState {
  @override
  List<Object?> get props => [];
}

class MealsByIngredientLoaded extends MealsByIngredientState {
  final List<Meal> loadedMeals;

  const MealsByIngredientLoaded({required this.loadedMeals});

  @override
  List<Object?> get props => [loadedMeals];
}

class MealsByIngredientError extends MealsByIngredientState {
  final String message;

  const MealsByIngredientError({required this.message});

  @override
  List<Object?> get props => [message];
}
