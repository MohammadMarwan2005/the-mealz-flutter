part of 'single_random_meal_cubit.dart';

abstract class SingleRandomMealState extends Equatable {
  const SingleRandomMealState();

  @override
  List<Object> get props => [];
}

class SingleRandomMealInitial extends SingleRandomMealState {}

class SingleRandomMealIsLoading extends SingleRandomMealState {}

class SingleRandomMealLoaded extends SingleRandomMealState {
  final FullMealDomainModel loadedMeal;

  const SingleRandomMealLoaded({required this.loadedMeal});

  @override
  List<Object> get props => [loadedMeal];
}

class SingleRandomMealError extends SingleRandomMealState {
  final String message;

  const SingleRandomMealError({required this.message});

  @override
  List<Object> get props => [message];
}
