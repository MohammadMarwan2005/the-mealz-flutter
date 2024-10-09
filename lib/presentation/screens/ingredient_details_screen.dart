import 'package:bloc_state_management/data/model/all_ingredients_response.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_ingredient/meals_by_ingredient_cubit.dart';
import 'package:bloc_state_management/presentation/screens/dynamic_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IngredientDetailsScreen extends StatelessWidget {
  final IngredientDomainModel ingredient;
  const IngredientDetailsScreen({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    context
        .read<MealsByIngredientCubit>()
        .getMealsByIngredient(ingredient.name);
    return BlocBuilder<MealsByIngredientCubit, MealsByIngredientState>(
        builder: (context, state) {
      debugPrint(state.runtimeType.toString());
      switch (state) {
        case MealsByIngredientLoaded _:
          return DynamicDetailsScreen(
            title: ingredient.name,
            imageUrl: ingredient.hdImageUrl,
            hasAbout: ingredient.description.isNotEmpty,
            about: ingredient.description,
            meals: state.loadedMeals,
            gridTitle: "Meals Contains ${ingredient.name}",
          );
        case MealsByIngredientError _:
          return const Scaffold(
              body: Center(child: Text("Sorry, something went wrong!")));
        case MealsByIngredientIsLoading _:
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        default:
          return const Placeholder();
      }
    });
  }
}
