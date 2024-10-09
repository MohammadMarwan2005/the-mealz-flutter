part of 'meals_by_category_dart_cubit.dart';

abstract class MealsByCategoryDartState extends Equatable {
  const MealsByCategoryDartState();
}

class MealsByCategoryDartInitial extends MealsByCategoryDartState {
  @override
  List<Object?> get props => [];
}

class MealsByCategoryIsLoading extends MealsByCategoryDartState {
  @override
  List<Object?> get props => [];
}

class MealsByCategoryLoaded extends MealsByCategoryDartState {
  final List<Meal> loadedMeals;

  const MealsByCategoryLoaded({required this.loadedMeals});

  @override
  List<Object?> get props => [loadedMeals];
}

class MealsByCategoryError extends MealsByCategoryDartState {
  final String message;

  const MealsByCategoryError({required this.message});

  @override
  List<Object?> get props => [message];
}
