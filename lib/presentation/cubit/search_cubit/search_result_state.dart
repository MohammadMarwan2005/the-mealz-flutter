part of 'search_result_cubit.dart';

abstract class SearchResultState extends Equatable {
  const SearchResultState();
  @override
  List<Object> get props => [];
}

class SearchResultInitial extends SearchResultState {}

class SearchResultIsLoading extends SearchResultState {}

class SearchResultLoaded extends SearchResultState {
  final List<FullMealDomainModel> loadedMeals;

  const SearchResultLoaded(this.loadedMeals);

  @override
  List<Object> get props => [loadedMeals];
}
class SearchResultError extends SearchResultState {
  final String message;

  const SearchResultError(this.message);

  @override
  List<Object> get props => [message];
}
