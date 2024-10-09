part of 'all_areas_cubit.dart';

abstract class AllAreasState extends Equatable {
  const AllAreasState();

  @override
  List<Object> get props => [];
}

class AllAreasInitial extends AllAreasState {}

class AllAreasIsLoading extends AllAreasState {}

class AllAreasError extends AllAreasState {
  final String message;

  const AllAreasError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllAreasLoaded extends AllAreasState {
  final List<AreaDomainModel> loadedAreas;

  const AllAreasLoaded({required this.loadedAreas});

  @override
  List<Object> get props => [loadedAreas];
}
