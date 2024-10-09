part of 'full_meal_details_cubit.dart';

abstract class FullMealDetailsState extends Equatable {
  const FullMealDetailsState();

  @override
  List<Object> get props => [];
}

final class FullMealDetailsInitial extends FullMealDetailsState {}

final class FullMealDetailsIsLoading extends FullMealDetailsState {}

final class FullMealDetailsLoaded extends FullMealDetailsState {
  final FullMealDomainModel loadedMeal;

  const FullMealDetailsLoaded({required this.loadedMeal});
  @override
  List<Object> get props => [loadedMeal];
}

final class FullMealDetailsError extends FullMealDetailsState {
  final String message;

  const FullMealDetailsError({required this.message});
  @override
  List<Object> get props => [message];
}
