part of 'meals_by_area_cubit.dart';

abstract class MealsByAreaState extends Equatable {
  const MealsByAreaState();

  @override
  List<Object> get props => [];
}

class MealsByAreaInitial extends MealsByAreaState {}

class MealsByAreaIsLoading extends MealsByAreaState {}

class MealsByAreaLoaded extends MealsByAreaState {
  final List<Meal> loadedMeals;

  const MealsByAreaLoaded({required this.loadedMeals});

  @override
  List<Object> get props => [loadedMeals];
}

class MealsByAreaError extends MealsByAreaState {
  final String message;

  const MealsByAreaError({required this.message});

  @override
  List<Object> get props => [message];
}
