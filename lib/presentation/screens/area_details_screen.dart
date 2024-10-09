import 'package:bloc_state_management/data/model/all_areas_response.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_area/meals_by_area_cubit.dart';
import 'package:bloc_state_management/presentation/screens/dynamic_details_screen.dart';
import 'package:bloc_state_management/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaDetailsScreen extends StatelessWidget {
  final AreaDomainModel area;
  const AreaDetailsScreen({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    context.read<MealsByAreaCubit>().getMeals(area.name);
    return BlocBuilder<MealsByAreaCubit, MealsByAreaState>(
      builder: (context, state) {
        debugPrint(state.runtimeType.toString());
        switch (state) {
          case MealsByAreaLoaded _:
            return DynamicDetailsScreen(
                title: area.name,
                imageUrl: area.imageUrl,
                provideImage: area.name == "Unknown",
                providedImage: getAreaImage(area),
                hasAbout: false,
                meals: state.loadedMeals,
                gridTitle: "${area.name} Meals",
                about: "");
          case MealsByAreaIsLoading _:
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          case MealsByAreaError _:
            return const Scaffold(
                body: Center(child: Text("Sorry, something went wrong!")));
          default:
            return const Placeholder();
        }
      },
    );
  }
}
